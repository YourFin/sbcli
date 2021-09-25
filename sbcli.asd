(defsystem "sbcli"
  :version "0.1.0"
  :author "hellerve"
  :license "GPLv3"
  :depends-on ("alexandria" "cl-readline" "str" "sb-introspect")
  :components ((:module "src"
                :components
                ((:file "repl"))))
  :description "A better repl for sbcl")
