(in-package :cl-user)

(defpackage :cl-mail.system
  (:use :cl :asdf))

(in-package :cl-mail.system)

(defsystem :cl-mail
  :version "0.1"
  :description "Collection of emails-related utilities for Common Lisp"  
  :maintainer "Ilya Khaprov <ilya.khaprov@publitechs.com>"
  :author "Ilya Khaprov <ilya.khaprov@publitechs.com>"
  :licence "MIT"
  :depends-on ("alexandria"
               "string-case"
               "trivial-backtrace"
               "quri"
               "log4cl")
  :components ((:module "src"
                :serial t
                :components
                ((:file "package")))))
