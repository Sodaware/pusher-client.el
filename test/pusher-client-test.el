;; Simple method tests

(ert-deftest pusher-client-test/can-create-client ()
  (let ((client (make-instance 'pusher-client)))
    (should (object-of-class-p client 'pusher-client))))

(ert-deftest pusher-client-test/can-create-client-with-key ()
  (let ((client (pusher-client-create "KEY")))
    (should (object-of-class-p client 'pusher-client))
    (should (string= "KEY" (oref client key)))))

(ert-deftest pusher-client-test/can-create-path ()
  (let ((client (pusher-client-create "KEY")))
    (should (string= "/app/KEY?client=pusher-client.el&version=0.1&protocol=6"
                     (pusher-client--create-path client)))))

(ert-deftest pusher-client-test/can-create-none-secure-uri ()
  (let ((client (pusher-client-create "KEY")))
    (should (string= "ws://ws.pusherapp.com:80/app/KEY?client=pusher-client.el&version=0.1&protocol=6"
                     (pusher-client--create-uri client)))))
