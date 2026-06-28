(repository
  (package
    (git
      (hash "725d1f7d8d539b6b7656b36f02e2d71b5a28bf39")
      (url "https://github.com/srfi-explorations/r7rs-srfi.git"))
    (maintainers "Retropikzel")
    (version "1.0.1")
    (library
      (name
        (srfi 19))
      (path "srfi/19.sld")
      (foreign-depends)
      (cond-expand
        (chicken
          (depends))
        (else
          (depends)))
      (depends
        (scheme base)
        (scheme write)
        (scheme read)
        (scheme file)
        (scheme time)
        (scheme char)
        (scheme cxr)
        (srfi 8)))
    (manual "README.html")
    (description "SRFI-19")
    (updated "2026-06-28T16:03:47+00:00"))
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
