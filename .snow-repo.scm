(repository
  (package
    (git
      (hash "d4773940faa2d8a624c8b6c751ea58f2179b2724")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "I/NET Inc" " Will Fitzgerald")
    (version "0.1.4")
    (license MIT)
    (library
      (name
        (srfi 19))
      (path "srfi/19.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme write)
        (scheme read)
        (scheme file)
        (scheme time)
        (scheme char)
        (scheme cxr)
        (srfi 8)))
    (manual "index.html")
    (description "SRFI-19 - Time Data Types and Procedures")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 19)
      (srfi 64))
    (updated "2026-08-29T08:49:40+00:00"))
  (package
    (git
      (hash "d4773940faa2d8a624c8b6c751ea58f2179b2724")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "I/NET Inc" " Will Fitzgerald")
    (version "0.1.3")
    (license MIT)
    (library
      (name
        (srfi 19))
      (path "srfi/19.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme write)
        (scheme read)
        (scheme file)
        (scheme time)
        (scheme char)
        (scheme cxr)
        (srfi 8)))
    (manual "index.html")
    (description "SRFI-19 - Time Data Types and Procedures")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 19)
      (srfi 64))
    (updated "2026-08-29T08:47:31+00:00"))
  (package
    (git
      (hash "7c82e72574891436f900255172b3495eac2081da")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Taylor R. Campbell" "William D Clinger")
    (version "0.1.0")
    (license MIT)
    (library
      (name
        (srfi 141))
      (path "srfi/141.sld")
      (foreign-depends)
      (depends
        (scheme base)))
    (manual "index.html")
    (description "SRFI-141 - SRFI 141: Integer division")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 141)
      (srfi 64))
    (updated "2026-08-28T13:14:47+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Richard A. O'Keefe" " Aubrey Jaffer")
    (version "0.1.2")
    (license MIT-0)
    (library
      (name
        (srfi 95))
      (path "srfi/95.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (srfi 63)))
    (manual "index.html")
    (description "SRFI-95 - Sorting and Merging")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 95)
      (srfi 64))
    (updated "2026-08-28T12:58:49+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "John David Stone")
    (version "0.1.3")
    (license MIT)
    (library
      (name
        (srfi 8))
      (path "srfi/8.sld")
      (foreign-depends)
      (depends
        (scheme base)))
    (manual "index.html")
    (description "SRFI-8 - receive: Binding to multiple values")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 8)
      (srfi 64))
    (updated "2026-08-28T12:58:48+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Chongkai Zhu")
    (version "0.1.1")
    (license MIT)
    (library
      (name
        (srfi 87))
      (path "srfi/87.sld")
      (foreign-depends)
      (cond-expand
        ((or larceny loko mit-scheme racket)
          (depends
            (scheme base)))
        (else
          (depends
            (scheme base))))
      (cond-expand
        ((or larceny loko mit-scheme racket)
          (depends))
        (else
          (depends)))
      (depends))
    (manual "index.html")
    (description "SRFI-87 - SRFI 87: =&gt; in case clauses")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 87)
      (srfi 64))
    (updated "2026-08-28T12:58:48+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Panu Kalliokoski")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 69))
      (path "srfi/69.sld")
      (foreign-depends)
      (cond-expand
        (tr7
          (depends
            (scheme base)
            (scheme char)
            (scheme cxr)))
        (else
          (depends
            (scheme base)
            (scheme char)
            (scheme complex)
            (scheme cxr))))
      (depends))
    (manual "index.html")
    (description "SRFI-69 - Basic hash tables")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 69)
      (srfi 64))
    (updated "2026-08-28T12:58:48+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Michael Sperber")
    (version "0.1.0")
    (license MIT)
    (library
      (name
        (srfi 66))
      (path "srfi/66.sld")
      (foreign-depends)
      (depends
        (scheme base)))
    (manual "index.html")
    (description "SRFI-66 - SRFI 66: Octet Vectors")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 66)
      (srfi 64))
    (updated "2026-08-28T12:58:47+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Per Bothner" "Alex Shinn" "Álvaro Castro-Castilla" "Mark H Weaver" "Taylan Ulrich Bayırlı/Kammer")
    (version "0.1.8")
    (license MIT)
    (library
      (name
        (srfi 64))
      (path "srfi/64.sld")
      (foreign-depends)
      (cond-expand
        (loko
          (depends
            (scheme base)
            (scheme case-lambda)
            (scheme complex)
            (scheme file)
            (scheme process-context)
            (scheme read)
            (scheme write)
            (srfi 1)))
        ((library (scheme complex))
          (depends
            (scheme base)
            (scheme case-lambda)
            (scheme complex)
            (scheme eval)
            (scheme file)
            (scheme process-context)
            (scheme read)
            (scheme write)
            (srfi 1)))
        (else
          (depends
            (scheme base)
            (scheme case-lambda)
            (scheme eval)
            (scheme file)
            (scheme process-context)
            (scheme read)
            (scheme write)
            (srfi 1))))
      (cond-expand
        (chicken
          (depends))
        (stklos
          (depends))
        (else
          (depends)))
      (depends))
    (manual "index.html")
    (description "SRFI-64 - SRFI 64: A Scheme API for test suites")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 64))
    (updated "2026-08-28T12:58:47+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Aubrey Jaffer")
    (version "0.1.3")
    (license MIT)
    (library
      (name
        (srfi 63))
      (path "srfi/63.sld")
      (foreign-depends)
      (depends
        (scheme base)))
    (manual "index.html")
    (description "SRFI-63 - Homogeneous and Heterogeneous Arrays")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 63)
      (srfi 64))
    (updated "2026-08-28T12:58:46+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Aubrey Jaffer")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 60))
      (path "srfi/60.sld")
      (foreign-depends)
      (depends
        (scheme base)))
    (manual "index.html")
    (description "SRFI-60 - Integers as Bits")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 60)
      (srfi 64))
    (updated "2026-08-28T12:58:46+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Andy Gaynor")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 5))
      (path "srfi/5.sld")
      (foreign-depends)
      (depends
        (scheme base)))
    (manual "index.html")
    (description "SRFI-5 - A compatible let form with signatures and rest arguments")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme write)
      (scheme process-context)
      (srfi 5)
      (srfi 64))
    (updated "2026-08-28T12:58:45+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Joo ChurlSoo")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 51))
      (path "srfi/51.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (srfi 1)))
    (manual "index.html")
    (description "SRFI-51 - Handling rest list")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 51)
      (srfi 64))
    (updated "2026-08-28T12:58:45+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "John Cowan")
    (version "0.1.1")
    (license MIT)
    (library
      (name
        (srfi 4))
      (path "srfi/4.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme inexact)))
    (manual "index.html")
    (description "SRFI-4 - SRFI 4: Homogeneous numeric vector datatypes")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme write)
      (scheme file)
      (scheme inexact)
      (scheme process-context)
      (srfi 4)
      (srfi 64))
    (updated "2026-08-28T12:58:45+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Kenneth A Dickey")
    (version "0.1.1")
    (license MIT)
    (library
      (name
        (srfi 48))
      (path "srfi/48.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme char)
        (scheme complex)
        (scheme write)
        (srfi 38)))
    (manual "index.html")
    (description "SRFI-48 - SRFI 48: Intermediate Format Strings")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 48)
      (srfi 64))
    (updated "2026-08-28T12:58:44+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Taylor Campbell" " Will Clinger")
    (version "0.1.2")
    (license MIT-0)
    (library
      (name
        (srfi 43))
      (path "srfi/43.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme cxr)
        (srfi 8)
        (srfi 227)))
    (manual "index.html")
    (description "SRFI-43 - Vector library")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (srfi 43)
      (srfi 64))
    (updated "2026-08-28T12:58:44+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Sebastian Egner")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 42))
      (path "srfi/42.sld")
      (foreign-depends)
      (cond-expand
        (tr7
          (depends
            (scheme base)
            (scheme read)
            (scheme cxr)))
        (else
          (depends
            (scheme base)
            (scheme read)
            (scheme cxr)
            (scheme complex))))
      (cond-expand
        (stklos
          (depends))
        (else
          (depends)))
      (cond-expand
        ((or chicken stklos)
          (depends))
        (else
          (depends)))
      (cond-expand
        (else
          (depends)))
      (depends))
    (manual "index.html")
    (description "SRFI-42 - Eager Comprehensions")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 42)
      (srfi 64))
    (updated "2026-08-28T12:58:43+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Philip L. Bewig")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 41))
      (path "srfi/41.sld")
      (foreign-depends)
      (cond-expand
        ((or cyclone mit-scheme)
          (depends))
        (stklos
          (depends))
        (else
          (depends)))
      (depends
        (scheme base)))
    (manual "index.html")
    (description "SRFI-41 - Streams")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 41)
      (srfi 64))
    (updated "2026-08-28T12:58:43+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Marc Feeley")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 39))
      (path "srfi/39.sld")
      (foreign-depends)
      (cond-expand
        (racket
          (depends
            (scheme base)))
        (tr7
          (depends
            (scheme base)))
        (else
          (depends
            (scheme base))))
      (cond-expand
        (stklos
          (depends))
        (cyclone
          (depends))
        (mit
          (depends))
        (else
          (depends)))
      (cond-expand
        (racket
          (depends))
        (tr7
          (depends))
        (else
          (depends)))
      (depends))
    (manual "index.html")
    (description "SRFI-39 - Parameter objects")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 39)
      (srfi 64))
    (updated "2026-08-28T12:58:42+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Ray Dillinger")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 38))
      (path "srfi/38.sld")
      (foreign-depends)
      (cond-expand
        (chibi
          (depends
            (chibi)
            (srfi 69)
            (chibi ast)))
        (else
          (depends
            (scheme base)
            (scheme char)
            (scheme cxr)
            (scheme write))))
      (cond-expand
        (chibi
          (depends))
        (else
          (depends)))
      (cond-expand
        (chibi
          (depends))
        (else
          (depends)))
      (depends))
    (manual "index.html")
    (description "SRFI-38 - External Representation for Data With Shared Structure")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 38)
      (srfi 64))
    (updated "2026-08-28T12:58:42+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Anthony Carrico")
    (version "0.1.2")
    (license MIT-click)
    (library
      (name
        (srfi 37))
      (path "srfi/37.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (srfi 11)))
    (manual "index.html")
    (description "SRFI-37 - args-fold: a program argument processor")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 37)
      (srfi 64))
    (updated "2026-08-28T12:58:41+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Mirko Luedde")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 31))
      (path "srfi/31.sld")
      (foreign-depends)
      (depends
        (scheme base)))
    (manual "index.html")
    (description "SRFI-31 - A special form `rec' for recursive evaluation")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 31)
      (srfi 64))
    (updated "2026-08-28T12:58:41+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Marc Nieper-Wißkirchen")
    (version "0.1.2")
    (license MIT-0)
    (library
      (name
        (srfi 2))
      (path "srfi/2.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme write)))
    (manual "index.html")
    (description "SRFI-2 - AND-LET*: an AND with local bindings, a guarded LET* special form")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 2)
      (srfi 64))
    (updated "2026-08-28T12:58:41+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Scott G. Miller.")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 29))
      (path "srfi/29.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme char)
        (scheme write)
        (srfi 28)))
    (manual "index.html")
    (description "SRFI-29 - Localization")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 28)
      (srfi 29)
      (srfi 64))
    (updated "2026-08-28T12:58:40+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Scott G. Miller")
    (version "0.1.1")
    (license MIT)
    (library
      (name
        (srfi 28))
      (path "srfi/28.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme write)))
    (manual "index.html")
    (description "SRFI-28 - SRFI 28: Basic Format Strings")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 28)
      (srfi 64))
    (updated "2026-08-28T12:58:40+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Sebastian Egner")
    (version "0.1.2")
    (license MIT-0)
    (library
      (name
        (srfi 27))
      (path "srfi/27.sld")
      (foreign-depends)
      (cond-expand
        (guile
          (depends))
        (else
          (depends)))
      (depends
        (scheme base)
        (scheme write)
        (scheme complex)
        (scheme time)))
    (manual "index.html")
    (description "SRFI-27 - Sources of Random Bits")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 27)
      (srfi 64))
    (updated "2026-08-28T12:58:40+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Michael Sperber" " Dale Jordan" " Al Petrofsky" " Sebastian Egner")
    (version "0.1.2")
    (license MIT-0)
    (library
      (name
        (srfi 26))
      (path "srfi/26.sld")
      (foreign-depends)
      (cond-expand
        (skint
          (depends))
        (else
          (depends)))
      (depends
        (scheme base)))
    (manual "index.html")
    (description "SRFI-26 - Notation for Specializing Parameters without Currying")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 26)
      (srfi 64))
    (updated "2026-08-28T12:58:39+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Jussi Piitulainen")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 25))
      (path "srfi/25.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme write)))
    (manual "index.html")
    (description "SRFI-25 - Multi-dimensional Array Primitives")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 25)
      (srfi 64))
    (updated "2026-08-28T12:58:39+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "John Cowan" " Arvydas Silanskas")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 235))
      (path "srfi/235.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme case-lambda)
        (srfi 1)))
    (manual "index.html")
    (description "SRFI-235 - Combinators")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 1)
      (srfi 235)
      (srfi 64))
    (updated "2026-08-28T12:58:38+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Wolfgang Corcoran-Mathe")
    (version "0.1.0")
    (license MIT)
    (library
      (name
        (srfi 232))
      (path "srfi/232.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme case-lambda)))
    (manual "index.html")
    (description "SRFI-232 - SRFI 232: Flexible curried procedures")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 232)
      (srfi 64))
    (updated "2026-08-28T12:58:38+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Daphne Preston-Kendal")
    (version "0.1.4")
    (license MIT)
    (library
      (name
        (srfi 227))
      (path "srfi/227.sld")
      (foreign-depends)
      (cond-expand
        (chicken
          (depends))
        (else
          (depends)))
      (depends
        (scheme base)
        (scheme case-lambda)))
    (manual "index.html")
    (description "SRFI-227 - Optional Arguments")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 227)
      (srfi 64))
    (updated "2026-08-28T12:58:38+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Wolfgang Corcoran-Mathe")
    (version "0.1.0")
    (license MIT)
    (library
      (name
        (srfi 209))
      (path "srfi/209.sld")
      (foreign-depends)
      (cond-expand
        ((library (srfi 162))
          (depends
            (srfi 162)))
        (else
          (depends)))
      (depends
        (scheme base)
        (scheme case-lambda)
        (srfi 1)
        (srfi 125)
        (srfi 128)
        (srfi 178)))
    (manual "index.html")
    (description "SRFI-209 - SRFI 209: Enums and Enum Sets")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme process-context)
      (srfi 1)
      (srfi 128)
      (srfi 209)
      (srfi 64))
    (updated "2026-08-28T12:58:37+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Alex Shinn" "Wolfgang Corcoran-Mathe")
    (version "0.1.0")
    (license MIT)
    (library
      (name
        (srfi 207))
      (path "srfi/207.sld")
      (foreign-depends)
      (cond-expand
        ((library (scheme bytevector))
          (depends
            (scheme bytevector)))
        (else
          (depends)))
      (cond-expand
        ((library (srfi 133))
          (depends
            (srfi 133)))
        (else
          (depends)))
      (cond-expand
        ((library (srfi 145))
          (depends
            (srfi 145)))
        (else
          (depends)))
      (cond-expand
        ((library (srfi 152))
          (depends
            (srfi 152)))
        ((library (srfi 130))
          (depends
            (srfi 130)))
        ((library (srfi 13))
          (depends
            (srfi 13)))
        (else
          (depends)))
      (cond-expand
        (guile
          (depends))
        (else
          (depends
            (srfi 160 u8))))
      (cond-expand
        ((library (srfi 158))
          (depends
            (srfi 158)))
        (else
          (depends)))
      (depends
        (scheme base)
        (scheme case-lambda)
        (scheme char)
        (srfi 1)
        (srfi 151)))
    (manual "index.html")
    (description "SRFI-207 - SRFI 207: String-notated bytevectors")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme process-context)
      (srfi 1)
      (srfi 207)
      (srfi 64))
    (updated "2026-08-28T12:58:37+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Olin Shivers")
    (version "0.1.4")
    (license MIT)
    (library
      (name
        (srfi 1))
      (path "srfi/1.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme cxr)
        (srfi 8)
        (srfi 227)))
    (manual "index.html")
    (description "SRFI-1 - List Library")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 1)
      (srfi 64))
    (updated "2026-08-28T12:58:36+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Adam R. Nelson")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 197))
      (path "srfi/197.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (srfi 2)))
    (manual "index.html")
    (description "SRFI-197 - Pipeline Operators")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 197)
      (srfi 64))
    (updated "2026-08-28T12:58:35+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Wolfgang Corcoran-Mathe")
    (version "0.1.0")
    (license MIT)
    (library
      (name
        (srfi 196))
      (path "srfi/196.sld")
      (foreign-depends)
      (cond-expand
        ((library (srfi 133))
          (depends
            (srfi 133)))
        ((library (srfi 43))
          (depends
            (srfi 43)))
        (else
          (depends)))
      (cond-expand
        ((library (srfi 145))
          (depends
            (srfi 145)))
        (else
          (depends)))
      (depends
        (scheme base)
        (scheme case-lambda)
        (srfi 1)))
    (manual "index.html")
    (description "SRFI-196 - SRFI 196: Range Objects")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme process-context)
      (srfi 1)
      (srfi 196)
      (srfi 64))
    (updated "2026-08-28T12:58:35+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Wolfgang Corcoran-Mathe")
    (version "0.1.0")
    (license MIT)
    (library
      (name
        (srfi 189))
      (path "srfi/189.sld")
      (foreign-depends)
      (cond-expand
        ((library (srfi 145))
          (depends
            (srfi 145)))
        (else
          (depends)))
      (depends
        (scheme base)
        (scheme case-lambda)
        (srfi 1)))
    (manual "index.html")
    (description "SRFI-189 - SRFI 189: Maybe and Either: optional container types")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme process-context)
      (srfi 1)
      (srfi 189)
      (srfi 64))
    (updated "2026-08-28T12:58:34+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Amirouche Boubekki")
    (version "0.1.1")
    (license MIT)
    (library
      (name
        (srfi 180))
      (path "srfi/180.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme inexact)
        (scheme case-lambda)
        (scheme char)
        (scheme write)
        (srfi 60)
        (srfi 145)))
    (manual "index.html")
    (description "SRFI-180 - SRFI 180: JSON")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 180)
      (srfi 64))
    (updated "2026-08-28T12:58:34+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Wolfgang Corcoran-Mathe")
    (version "0.1.0")
    (license MIT)
    (library
      (name
        (srfi 178))
      (path "srfi/178.sld")
      (foreign-depends)
      (cond-expand
        ((library (srfi 133))
          (depends
            (srfi 133)))
        (else
          (depends)))
      (depends
        (srfi 160 u8)
        (srfi 160 base)
        (srfi 151)
        (scheme case-lambda)
        (scheme base)))
    (manual "index.html")
    (description "SRFI-178 - SRFI 178: Bitvector library\r")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 178)
      (srfi 64))
    (updated "2026-08-28T12:58:33+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Lars T Hansen")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 16))
      (path "srfi/16.sld")
      (foreign-depends)
      (depends
        (scheme base)))
    (manual "index.html")
    (description "SRFI-16 - Syntax for procedures of variable arity")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 16)
      (srfi 64))
    (updated "2026-08-28T12:58:33+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "MIT" " Brian D. Carlstrom" " Olin Shivers")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 14))
      (path "srfi/14.sld")
      (foreign-depends)
      (cond-expand
        (mosh
          (depends
            (srfi :14 char-sets)))
        (else
          (depends)))
      (depends
        (scheme base)
        (scheme char)
        (scheme write)
        (srfi 60)))
    (manual "index.html")
    (description "SRFI-14 - Character-set Library")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 14)
      (srfi 64))
    (updated "2026-08-28T12:58:33+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Marc Nieper-Wißkirchen")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 145))
      (path "srfi/145.sld")
      (foreign-depends)
      (depends
        (scheme base)))
    (manual "index.html")
    (description "SRFI-145 - Assumptions")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 145)
      (srfi 64))
    (updated "2026-08-28T12:58:32+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Olin Shivers")
    (version "0.1.1")
    (license BSD-3-Clause)
    (library
      (name
        (srfi 13))
      (path "srfi/13.sld")
      (foreign-depends)
      (cond-expand
        (else
          (depends)))
      (depends
        (scheme base)
        (scheme char)
        (srfi 8)
        (srfi 14)
        (srfi 60)
        (srfi 227)))
    (manual "index.html")
    (description "SRFI-13 - SRFI 13: String Libraries")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme char)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 13)
      (srfi 14)
      (srfi 64))
    (updated "2026-08-28T12:58:32+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "John Cowan")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 128))
      (path "srfi/128.sld")
      (foreign-depends)
      (cond-expand
        (tr7
          (depends
            (scheme base)
            (scheme case-lambda)
            (scheme char)
            (scheme inexact)))
        (else
          (depends
            (scheme base)
            (scheme case-lambda)
            (scheme char)
            (scheme inexact)
            (scheme complex))))
      (cond-expand
        (mit
          (depends))
        (else
          (depends)))
      (depends))
    (manual "index.html")
    (description "SRFI-128 - SRFI 128: Comparators (reduced)")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 128)
      (srfi 64))
    (updated "2026-08-28T12:58:31+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Lars T Hansen")
    (version "0.1.5")
    (license MIT)
    (library
      (name
        (srfi 11))
      (path "srfi/11.sld")
      (foreign-depends)
      (cond-expand
        (stklos
          (depends
            (scheme base)))
        (racket
          (depends
            (scheme base)))
        (else
          (depends
            (scheme base))))
      (cond-expand
        (stklos
          (depends))
        (else
          (depends)))
      (depends))
    (manual "index.html")
    (description "SRFI-11 - Syntax for receiving multiple values")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme write)
      (scheme process-context)
      (srfi 11)
      (srfi 64))
    (updated "2026-08-28T12:58:31+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "John Cowan")
    (version "0.1.1")
    (license MIT)
    (library
      (name
        (srfi 116))
      (path "srfi/116.sld")
      (foreign-depends)
      (cond-expand
        (gauche
          (depends
            (gauche base)))
        (else
          (depends)))
      (depends
        (scheme base)
        (srfi 128)))
    (manual "index.html")
    (description "SRFI-116 - SRFI 116: Immutable List Library")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme complex)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 128)
      (srfi 116)
      (srfi 64))
    (updated "2026-08-28T12:58:30+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Alex Shinn")
    (version "0.1.1")
    (license BSD)
    (library
      (name
        (srfi 115))
      (path "srfi/115.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme char)
        (srfi 1)
        (srfi 14)
        (srfi 60)
        (srfi 69)))
    (manual "index.html")
    (description "SRFI-115 - SRFI 115: Scheme Regular Expressions")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 115)
      (srfi 64))
    (updated "2026-08-28T12:58:30+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "John Cowan")
    (version "0.1.1")
    (license MIT)
    (library
      (name
        (srfi 113))
      (path "srfi/113.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme case-lambda)
        (scheme write)
        (srfi 128)
        (srfi 69)))
    (manual "index.html")
    (description "SRFI-113 - SRFI 113: Sets and Bags")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme complex)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 128)
      (srfi 113)
      (srfi 64))
    (updated "2026-08-28T12:58:29+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "Retropikzel")
    (version "0.1.2")
    (license MIT)
    (library
      (name
        (srfi 112))
      (path "srfi/112.sld")
      (foreign-depends)
      (cond-expand
        (gauche
          (depends
            (gauche base)))
        (guile
          (depends
            (guile)))
        (loko
          (depends
            (loko)))
        (racket
          (depends
            (racket base)))
        (else
          (depends)))
      (depends
        (scheme base)
        (scheme char)
        (scheme read)
        (scheme write)
        (scheme file)
        (scheme process-context)))
    (manual "index.html")
    (description "SRFI-112 - SRFI 112: Environment Inquiry\r")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 112)
      (srfi 64))
    (updated "2026-08-28T12:58:29+00:00"))
  (package
    (git
      (hash "023a8fee44599b8a7767bc26acebef1d5feefb38")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (authors "John Cowan")
    (version "0.1.1")
    (license MIT)
    (library
      (name
        (srfi 111))
      (path "srfi/111.sld")
      (foreign-depends)
      (depends
        (scheme base)))
    (manual "index.html")
    (description "SRFI-111 - SRFI 111: Boxes")
    (test "test.scm")
    (test-depends
      (scheme base)
      (scheme char)
      (scheme inexact)
      (scheme read)
      (scheme write)
      (scheme process-context)
      (scheme file)
      (scheme cxr)
      (srfi 111)
      (srfi 64))
    (updated "2026-08-28T12:58:28+00:00"))
  (package
    (git
      (hash "6150d85222aa79745219a5190038f95180dc6e7f")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (version "0.1.0")
    (library
      (name
        (srfi 180))
      (path "srfi/180.sld")
      (foreign-depends)
      (depends
        (scheme base)
        (scheme inexact)
        (scheme case-lambda)
        (scheme char)
        (scheme write)
        (srfi 60)
        (srfi 145)))
    (manual "README.html")
    (description "SRFI-180")
    (updated "2026-06-23T17:37:46+00:00"))
  (package
    (git
      (hash "6150d85222aa79745219a5190038f95180dc6e7f")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (version "0.1.0")
    (library
      (name
        (srfi 145))
      (path "srfi/145.sld")
      (foreign-depends)
      (depends
        (scheme base)))
    (manual "README.html")
    (description "SRFI-145")
    (updated "2026-06-23T17:37:36+00:00"))
  (package
    (git
      (hash "6150d85222aa79745219a5190038f95180dc6e7f")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (version "0.1.0")
    (library
      (name
        (srfi 60))
      (path "srfi/60.sld")
      (foreign-depends)
      (depends
        (scheme base)))
    (manual "README.html")
    (description "SRFI-60")
    (updated "2026-06-23T17:37:04+00:00"))
  (package
    (git
      (hash "6150d85222aa79745219a5190038f95180dc6e7f")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (version "0.1.3")
    (library
      (name
        (srfi 64))
      (path "srfi/64.sld")
      (foreign-depends)
      (cond-expand
        ((library (scheme complex))
          (depends
            (scheme base)
            (scheme case-lambda)
            (scheme complex)
            (scheme eval)
            (scheme file)
            (scheme process-context)
            (scheme read)
            (scheme write)))
        (else
          (depends
            (scheme base)
            (scheme case-lambda)
            (scheme eval)
            (scheme file)
            (scheme process-context)
            (scheme read)
            (scheme write))))
      (cond-expand
        (chicken
          (depends))
        (stklos
          (depends))
        (meevax
          (depends))
        (else
          (depends)))
      (cond-expand
        (chicken-5
          (depends))
        (else
          (depends)))
      (cond-expand
        (racket
          (depends))
        (else
          (depends)))
      (depends))
    (manual "README.html")
    (description "SRFI-64")
    (updated "2026-06-23T17:36:58+00:00")))
