;;;;peuler.asd
;;;;
;;;;Copyright (c) 2021 Izaak Walton

(asdf:defsystem #:peuler
  :version "0.0.1"
  :author "Izaak Walton <izaakw@protonmail.com>"
  :license "GNU General Purpose License"
  :description "An evolving package of Project Euler solutions."
  :depends-on (#:alexandria)
  :serial t
  :components ((:file "package")
	       (:file "peuler001")
	       (:file "peuler002")
	       (:file "peuler003")
	       (:file "peuler004")
	       (:file "peuler005")
	       (:file "peuler006");(:file "peuler003")
               (:file "peuler007")))
	      ; (:file "peuler008")
	      ; (:file "peuler009")
	      ; (:file "peuler010")
	      ; (:file "peuler011")))
					;(:file "peuler004")))
