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

;; Client

(defclass pusher-client ()
  ((host :init-arg :host)
   (key :init-arg :key)
   (secret :init-arg :secret)
   (user-data :init-arg :user-data)
   (channels :init-arg :channels))
  "A Pusher client")


(provide 'pusher-client)
;;; pusher-client.el ends here
