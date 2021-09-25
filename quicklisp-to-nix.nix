{ stdenv, lib, fetchurl, pkgs, clwrapper }:
let
  quicklisp-to-nix-packages = rec {
    inherit stdenv lib fetchurl clwrapper pkgs quicklisp-to-nix-packages;

    callPackage = pkgs.lib.callPackageWith quicklisp-to-nix-packages;
    buildLispPackage = pkgs.lispPackages.buildLispPackage;
    qlOverrides = callPackage ./quicklisp-to-nix-overrides.nix { };

    "trivial-backtrace" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."trivial-backtrace" or (x: { }))
        (import ./quicklisp-to-nix-output/trivial-backtrace.nix {
          inherit fetchurl;
        }));

    "net_dot_didierverna_dot_asdf-flv" = buildLispPackage ((f: x: (x // (f x)))
      (qlOverrides."net_dot_didierverna_dot_asdf-flv" or (x: { }))
      (import ./quicklisp-to-nix-output/net_dot_didierverna_dot_asdf-flv.nix {
        inherit fetchurl;
      }));

    "trivial-gray-streams" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."trivial-gray-streams" or (x: { }))
        (import ./quicklisp-to-nix-output/trivial-gray-streams.nix {
          inherit fetchurl;
        }));

    "cl-ppcre-test" = quicklisp-to-nix-packages."cl-ppcre";

    "fiveam" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."fiveam" or (x: { }))
        (import ./quicklisp-to-nix-output/fiveam.nix {
          inherit fetchurl;
          "alexandria" = quicklisp-to-nix-packages."alexandria";
          "net_dot_didierverna_dot_asdf-flv" =
            quicklisp-to-nix-packages."net_dot_didierverna_dot_asdf-flv";
          "trivial-backtrace" = quicklisp-to-nix-packages."trivial-backtrace";
        }));

    "uiop" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."uiop" or (x: { }))
        (import ./quicklisp-to-nix-output/uiop.nix { inherit fetchurl; }));

    "cl-json" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."cl-json" or (x: { }))
        (import ./quicklisp-to-nix-output/cl-json.nix {
          inherit fetchurl;
          "fiveam" = quicklisp-to-nix-packages."fiveam";
        }));

    "flexi-streams" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."flexi-streams" or (x: { }))
        (import ./quicklisp-to-nix-output/flexi-streams.nix {
          inherit fetchurl;
          "trivial-gray-streams" =
            quicklisp-to-nix-packages."trivial-gray-streams";
        }));

    "cl-unicode" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."cl-unicode" or (x: { }))
        (import ./quicklisp-to-nix-output/cl-unicode.nix {
          inherit fetchurl;
          "cl-ppcre" = quicklisp-to-nix-packages."cl-ppcre";
          "flexi-streams" = quicklisp-to-nix-packages."flexi-streams";
        }));

    "cl-ppcre-unicode" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."cl-ppcre-unicode" or (x: { }))
        (import ./quicklisp-to-nix-output/cl-ppcre-unicode.nix {
          inherit fetchurl;
          "cl-ppcre" = quicklisp-to-nix-packages."cl-ppcre";
          "cl-ppcre-test" = quicklisp-to-nix-packages."cl-ppcre-test";
          "cl-unicode" = quicklisp-to-nix-packages."cl-unicode";
          "flexi-streams" = quicklisp-to-nix-packages."flexi-streams";
        }));

    "cl-ppcre" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."cl-ppcre" or (x: { }))
        (import ./quicklisp-to-nix-output/cl-ppcre.nix {
          inherit fetchurl;
          "flexi-streams" = quicklisp-to-nix-packages."flexi-streams";
        }));

    "cl-change-case" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."cl-change-case" or (x: { }))
        (import ./quicklisp-to-nix-output/cl-change-case.nix {
          inherit fetchurl;
          "cl-ppcre" = quicklisp-to-nix-packages."cl-ppcre";
          "cl-ppcre-unicode" = quicklisp-to-nix-packages."cl-ppcre-unicode";
          "cl-unicode" = quicklisp-to-nix-packages."cl-unicode";
          "fiveam" = quicklisp-to-nix-packages."fiveam";
          "flexi-streams" = quicklisp-to-nix-packages."flexi-streams";
        }));

    "trivial-features" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."trivial-features" or (x: { }))
        (import ./quicklisp-to-nix-output/trivial-features.nix {
          inherit fetchurl;
        }));

    "cffi" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."cffi" or (x: { }))
        (import ./quicklisp-to-nix-output/cffi.nix {
          inherit fetchurl;
          "alexandria" = quicklisp-to-nix-packages."alexandria";
          "babel" = quicklisp-to-nix-packages."babel";
          "cl-json" = quicklisp-to-nix-packages."cl-json";
          "cl-ppcre" = quicklisp-to-nix-packages."cl-ppcre";
          "trivial-features" = quicklisp-to-nix-packages."trivial-features";
          "uiop" = quicklisp-to-nix-packages."uiop";
        }));

    "babel" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."babel" or (x: { }))
        (import ./quicklisp-to-nix-output/babel.nix {
          inherit fetchurl;
          "alexandria" = quicklisp-to-nix-packages."alexandria";
          "trivial-features" = quicklisp-to-nix-packages."trivial-features";
        }));

    "str" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."str" or (x: { }))
        (import ./quicklisp-to-nix-output/str.nix {
          inherit fetchurl;
          "cl-change-case" = quicklisp-to-nix-packages."cl-change-case";
          "cl-ppcre" = quicklisp-to-nix-packages."cl-ppcre";
          "cl-ppcre-unicode" = quicklisp-to-nix-packages."cl-ppcre-unicode";
          "cl-unicode" = quicklisp-to-nix-packages."cl-unicode";
          "flexi-streams" = quicklisp-to-nix-packages."flexi-streams";
        }));

    "cl-readline" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."cl-readline" or (x: { }))
        (import ./quicklisp-to-nix-output/cl-readline.nix {
          inherit fetchurl;
          "alexandria" = quicklisp-to-nix-packages."alexandria";
          "babel" = quicklisp-to-nix-packages."babel";
          "cffi" = quicklisp-to-nix-packages."cffi";
          "trivial-features" = quicklisp-to-nix-packages."trivial-features";
        }));

    "alexandria" = buildLispPackage
      ((f: x: (x // (f x))) (qlOverrides."alexandria" or (x: { }))
        (import ./quicklisp-to-nix-output/alexandria.nix {
          inherit fetchurl;
        }));

  };
in quicklisp-to-nix-packages
