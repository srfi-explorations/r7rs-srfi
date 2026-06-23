(repository
  (package
    (git
      (hash "c9c50e94a387d96cf609a0b84242b5bb340afe89")
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
    (updated "2026-06-23T17:18:15+00:00"))
  (package
    (git
      (hash "c9c50e94a387d96cf609a0b84242b5bb340afe89")
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
    (updated "2026-06-23T17:17:56+00:00")))
