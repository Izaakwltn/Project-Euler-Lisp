;;;; dounis.asd
;;;;
;;;; Copyright (c) 2021 Izaak Walton

(asdf:defsystem #:dounis
  :version "0.0.1"
  :author "Izaak Walton <izaakw@protonmail.com>"
  :license "GNU General Purpose License"
  :description "A Toolkit for Project Euler problems written in Common Lisp"
  :depends-on (#:alexandria #:bordeaux-threads)
  :serial t
  :components ((:module "dounis"
	       :serial t
	       :components ((:file "package")))))
