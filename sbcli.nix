{ stdenv, pkgs }:
let
  quicklisp-to-nix-packages = pkgs.callPackage ./quicklisp-to-nix.nix
    (with pkgs.lispPackages; { inherit clwrapper stdenv pkgs lib; });
  #  buildLispPackage = pkgs.callPackage ./define-package.nix;
  sbcliFile = ''
    #!/bin/sh
    @out@/lib/common-lisp/common-lisp-settings/sbcli-lisp-launcher.sh \
      --eval "(asdf:load-system :sbcli)" --eval "(sbcli:main)"
  '';

in pkgs.lispPackages.buildLispPackage rec {
  baseName = "sbcli";
  version = "0.0.1";
  description = "A better cli for sbcl";
  deps = with quicklisp-to-nix-packages; [ alexandria cl-readline str ];
  src = ./.;
  packageName = "sbcli";
  asdFilesToKeep = [ "sbcli.asd" ];
  overrides = x: {
    postInstall = ''
      mkdir -p $out/lib/common-lisp/common-lisp-settings/
      mv $out/bin/sbcli-lisp-launcher.sh\
        $out/lib/common-lisp/common-lisp-settings/sbcli-lisp-launcher.sh
      echo '${sbcliFile}' > $out/bin/sbcli
      substituteAllInPlace $out/bin/sbcli
      chmod a+x $out/bin/sbcli
    '';
    dontStrip = true;
  };
}
