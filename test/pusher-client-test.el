;; Simple method tests

(ert-deftest pusher-client-test/can-create-client ()
  (let ((client (make-instance 'pusher-client)))
    (should (object-of-class-p client 'pusher-client))))

(ert-deftest pusher-client-test/can-create-client-with-key ()
  (let ((client (pusher-client-create "KEY")))
    (should (object-of-class-p client 'pusher-client))
    (should (string= "KEY" (oref client key)))))
