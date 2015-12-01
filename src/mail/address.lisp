(in-package :cl-mail)

(defclass mail-address ()
  ((display-name :initarg :display-name :reader mail-address-display-name)
   (address :initarg :address :reader mail-address-address)
   (user :initarg :user :reader mail-address-user)
   (host :initarg :host :reader mail-address-host)
   (comments :initarg :comments :reader mail-address-comments)))

(defun mail-address.parse (string)
  (loop for single-address in (split-sequence #\, string :remove-empty-subseqs t)
        collect (mail-address-parser single-address)))

(defgeneric mail-address.new (value))

(defmethod mail-address.new ((value string))
  (first (mail-address.parse value)))
