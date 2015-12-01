(in-package :cl-mail.test)

(plan 1)

(subtest "Address parsing"

  (subtest "Malformed addresses"
    (is-error (cl-mail:mail-address.new "\"-Earnings...Notification-\" <vodacom.co.rs>") error))
  
  (subtest "Just address"
    (let ((address (mail-address.new "test1@test.net")))
      (is (mail-address-display-name address) nil)
      (is (mail-address-address address) "test1@test.net")
      (is (mail-address-host address) "test.net")
      (is (mail-address-user address) "test1")
      (is (mail-address-comments address) nil)))

  (subtest "Display name and address"
    (let ((address (mail-address.new "Test Test     <test1@test.net>")))
      (is (mail-address-display-name address) "Test Test")
      (is (mail-address-address address) "test1@test.net")
      (is (mail-address-host address) "test.net")
      (is (mail-address-user address) "test1")
      (is (mail-address-comments address) nil)))

  (subtest "Quoted display name and address"
    (let ((address (mail-address.new "\"Test @ Test <<>>>\"    <test1@test.net>")))
      (is (mail-address-display-name address) "Test @ Test <<>>>")
      (is (mail-address-address address) "test1@test.net")
      (is (mail-address-host address) "test.net")
      (is (mail-address-user address) "test1")
      (is (mail-address-comments address) nil))))

(finalize)
