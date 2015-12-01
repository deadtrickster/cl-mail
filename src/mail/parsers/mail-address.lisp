(in-package :cl-mail)

(defun trim-whitespace (value &optional (chars '(#\Space #\Tab #\Newline #\Return)))
  (when value
      (string-trim chars value)))

(defun mail-address-parser (string)
  (let ((display-name) (address) (user) (host) (comments))
    (setf string (trim-whitespace string))
    (let ((idx))
      (setf idx (position #\" string))
      (when idx
        (when (or (not (= idx 0)) (= (length string) 1))
          (error "Malformed email string"))
        (let ((closing (position #\" string :from-end t)))
          (when (= closing idx)
            (error "Malformed email string"))
          (setf display-name (trim-whitespace (subseq string (1+ idx) closing)))
          (setf string (trim-whitespace (subseq string (1+ closing))))))

      (setf idx (position #\< string))
      (when idx
        (unless display-name
          (setf display-name (trim-whitespace (subseq string 0 idx))))
        (when (= (1- (length string)) idx)
          (error "Malformed email string"))

        (let ((end (position #\> string :start (1+ idx))))
          (unless end           
            (error "Malformed email string"))
          (setf string (trim-whitespace (subseq string (1+ idx) end)))))
      (setf address string)

      (setf idx (position #\@ string))
      (unless idx
        (error "Malformed email string"))
      (unless (= idx (position #\@ string :from-end t))
        (error "Malformed email string"))

      (setf user (trim-whitespace (subseq string 0 idx)))
      (when (= 0 (length user))         
        (error "Malformed email string"))
      (setf host (trim-whitespace (subseq string (1+ idx))))
      (when (= 0 (length user))        
        (error "Malformed email string")))
    (make-instance 'mail-address :display-name display-name
                                 :address address
                                 :user user
                                 :host host
                                 :comments comments)))
