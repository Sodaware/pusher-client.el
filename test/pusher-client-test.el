;; Simple method tests

(ert-deftest pusher-client-test/can-create-client ()
  (let ((client (make-instance 'pusher-client)))
    (should (object-of-class-p client 'pusher-client))))
