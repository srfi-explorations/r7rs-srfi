(define-library
  (srfi 29)
  (import (scheme base)
          (scheme char)
          (scheme write)
          (srfi 28))
  (export current-language
          current-country
          current-locale-details
          declare-bundle!
          store-bundle!
          load-bundle!
          localized-template)
  (include "29.scm"))
