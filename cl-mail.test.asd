(in-package :cl-user)

(defpackage :cl-mail.test.system
  (:use :cl :asdf))

(in-package :cl-mail.test.system)

(defsystem :cl-mail.test
  :version "0.1"
  :description "Tests for cl-mail"
  :maintainer "Ilya Khaprov <ilya.khaprov@publitechs.com>"
  :author "Ilya Khaprov <ilya.khaprov@publitechs.com> and CONTRIBUTORS"
  :licence "MIT"
  :depends-on ("cl-mail"
               "prove"
               "log4cl"
               "cl-interpol"
               "mw-equiv")
  :serial t
  :components ((:module "t"
                :serial t
                :components
                ((:file "package")
                 (:test-file "dummy"))))
  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)))
