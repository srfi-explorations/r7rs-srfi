(package
  (maintainers "Arvydas Silanskas <nma.arvydas.silanskas@gmail.com>")
  (authors "Arvydas Silanskas")
  (version "1.0.2")
  (license mit)
  (library
    (name
      (arvyy mustache))
    (path "arvyy/mustache.sld")
    (depends
      (scheme base)
      (scheme case-lambda)
      (scheme write)
      (arvyy mustache lookup)
      (arvyy mustache collection)
      (arvyy mustache executor)
      (arvyy mustache parser)
      (arvyy mustache tokenizer)
      (srfi 1)))
  (library
    (name
      (arvyy mustache collection))
    (path "arvyy/mustache/collection.sld")
    (depends
      (scheme base)
      (srfi 41)))
  (library
    (name
      (arvyy mustache executor))
    (path "arvyy/mustache/executor.sld")
    (depends
      (scheme base)
      (arvyy mustache parser)))
  (library
    (name
      (arvyy mustache lookup))
    (path "arvyy/mustache/lookup.sld")
    (depends
      (scheme base)))
  (library
    (name
      (arvyy mustache parser))
    (path "arvyy/mustache/parser.sld")
    (depends
      (scheme base)
      (scheme write)
      (scheme cxr)
      (arvyy mustache tokenizer)
      (srfi 1)))
  (library
    (name
      (arvyy mustache tokenizer))
    (path "arvyy/mustache/tokenizer.sld")
    (depends
      (scheme base)))
  (library
    (name
      (arvyy mustache-test))
    (path "arvyy/mustache-test.sld")
    (cond-expand
      (chibi
        (depends
          (chibi test)))
      ((library (srfi 64))
        (depends
          (srfi 64)))
      (else
        (depends)))
    (depends
      (scheme base)
      (scheme write)
      (arvyy mustache)
      (srfi 41))
    (use-for test))
  (manual "readme.html")
  (description "Mustache templating 1.2.1 implementation")
  (test "run-tests.scm"))
