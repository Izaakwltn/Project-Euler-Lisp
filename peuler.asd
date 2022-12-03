;;;; peuler.asd
;;;;
;;;; Copyright (c) 2021 Izaak Walton

(asdf:defsystem #:peuler
  :version "0.0.1"
  :author "Izaak Walton <izaakw@protonmail.com>"
  :license "GNU General Purpose License"
  :description "Solutions for Project Euler problems written in Common Lisp."
  :depends-on (#:alexandria) ; add bordeaux-threads
  :serial t
  :components ((:file "package")
	       (:file "peuler001")
	       (:file "peuler002")
	       (:file "peuler003")
	       (:file "peuler004")
	       (:file "peuler005")
	       (:file "peuler006")
               (:file "peuler007")
	       (:file "peuler008")
	       (:file "peuler009")
	       (:file "peuler010")
	       (:file "peuler011")
	       (:file "peuler012")
	       (:file "peuler013")
	       (:file "peuler014")
	       (:file "peuler015")
	       (:file "peuler016")
	       (:file "peuler017")
	       (:file "peuler018")
	       (:file "peuler019")
	       (:file "peuler020")
	       (:file "peuler021")
	       ;(:file "peuler022")
	       ;(:file "peuler023")
	       ;(:file "peuler024")
	       (:file "peuler025")
	       ;(:file "peuler026")
	       ;(:file "peuler027")
	       (:file "peuler028")
	       (:file "peuler029")
	       (:file "peuler030")
	       ;(:file "peuler031")
	       ;(:file "peuler032")
	       ;(:file "peuler033")
	       (:file "peuler034")
	       (:file "peuler047")
	       (:file "peuler048")
	       (:file "peuler050")))
