/* Generated file. */
args @ { fetchurl, ... }:
rec {
  baseName = "cl-readline";
  version = "20201016-git";

  description = "Common Lisp bindings to GNU Readline library";

  deps = [ args."alexandria" args."babel" args."cffi" args."trivial-features" ];

  src = fetchurl {
    url = "http://beta.quicklisp.org/archive/cl-readline/2020-10-16/cl-readline-20201016-git.tgz";
    sha256 = "1aw4q9hd33igc6qig9k0h3m6473k5ysf3r7h4dzn45fr6mfljkki";
  };

  packageName = "cl-readline";

  asdFilesToKeep = ["cl-readline.asd"];
  overrides = x: x;
}
/* (SYSTEM cl-readline DESCRIPTION Common Lisp bindings to GNU Readline library
    SHA256 1aw4q9hd33igc6qig9k0h3m6473k5ysf3r7h4dzn45fr6mfljkki URL
    http://beta.quicklisp.org/archive/cl-readline/2020-10-16/cl-readline-20201016-git.tgz
    MD5 4b0d3ea543d566c1386f5a19c3dc2161 NAME cl-readline FILENAME cl-readline
    DEPS
    ((NAME alexandria FILENAME alexandria) (NAME babel FILENAME babel)
     (NAME cffi FILENAME cffi)
     (NAME trivial-features FILENAME trivial-features))
    DEPENDENCIES (alexandria babel cffi trivial-features) VERSION 20201016-git
    SIBLINGS NIL PARASITES NIL) */
