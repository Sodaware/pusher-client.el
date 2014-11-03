;;; pusher-client.el --- Library for working with pusher.com API's

;; Copyright (C) 2014 Phil Newton

;; Author: Phil Newton <phil@sodaware.net>
;; Version: 0.1.0
;; Package-Requires: ((json "1.2") (websocket "1.3"))
;; Keywords: pusher api websockets

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

;; Dependencies

(require 'json)
(require 'url-http)

(defvar url-http-end-of-headers)

;; Configuration

(defconst pusher-client-api-url "%s://%s:%s%s")
(defconst pusher-client-api-path "/app/%s?client=%s&version=%s&protocol=%s")


;; Client

(defclass pusher-client ()
  ((host :init-arg :host)
   (key :init-arg :key)
   (secret :init-arg :secret)
   (user-data :init-arg :user-data)
   (channels :init-arg :channels)
   (connection :init-arg :connection)
   (protocol-version :init-arg :protocol-version)
   (user-agent :init-arg :user-agent)
   (client-version :init-arg :client-version))
  "A Pusher client")

(defun pusher-client-create (app-key &optional secret)
  "Create a new client for APP-KEY."
  (let ((client (make-instance 'pusher-client)))
    (oset client key app-key)
    (oset client host "ws.pusherapp.com")
    (oset client user-agent "pusher-client.el")
    (oset client protocol-version "6")
    (oset client client-version "0.1")
    client))

(defmethod pusher-client-connect ((this pusher-client))
  "Connect to the pusher server.")

(defmethod pusher-client-disconnect ((this pusher-client))
  "Disconnect from the pusher server.")

(defmethod pusher-client-subscribe ((this pusher-client) channel)
  "Subscribe to CHANNEL.")

(defmethod pusher-client-unsubscribe ((this pusher-client) channel)
  "Unscubscribe from CHANNEL.")

(defmethod pusher-client-get-channel ((this pusher-client) channel)
  "Get CHANNEL object.")

(defun pusher-client--create-uri (client &optional is-secure)
  "Create a URI for CLIENT with optional IS-SECURE prefix."
  (format pusher-client-api-url
          (if is-secure "wss" "ws")
          (oref client host)
          (if is-secure 433 80)
          (pusher-client--create-path client)))

(defun pusher-client--create-path (client)
  "Create the path for CLIENT."
  (format pusher-client-api-path
          (oref client key)
          (oref client user-agent)
          (oref client client-version)
          (oref client protocol-version)))


(provide 'pusher-client)
;;; pusher-client.el ends here
