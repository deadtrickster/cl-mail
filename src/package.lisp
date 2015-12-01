(in-package :cl-user)

(defpackage :cl-mail
  (:use :cl
        :alexandria
        :string-case
        :split-sequence)
  (:export #:mail-address.new
           #:mail-address.parse
           #:mail-address-display-name
           #:mail-address-address
           #:mail-address-host
           #:mail-address-user
           #:mail-address-comments))

(in-package :cl-mail)
