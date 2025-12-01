;; From here https://github.com/scheme-requests-for-implementation/srfi-180

;; Copyright © Amirouche Boubekki (2020).
;; Copyright © Retropikzel (2025).
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to
;; deal in the Software without restriction, including without limitation the
;; rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
;; sell copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice (including the next
;; paragraph) shall be included in all copies or substantial portions of the
;; Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
;; IN THE SOFTWARE.

(define-library (srfi srfi-180)
  (export json-number-of-character-limit
          json-nesting-depth-limit
          json-null?
          json-error?
          json-error-reason
          json-fold
          json-generator
          json-read
          json-lines-read
          json-sequence-read
          json-accumulator
          json-write)
  (import (scheme base)
          (scheme inexact)
          (scheme case-lambda)
          (scheme char)
          (scheme write)
          (srfi 145)
          (srfi 60))
  #;(cond-expand ((library (srfi 60))
                (import (only (srfi 60) arithmetic-shift bitwise-ior)))
               ((library (srfi 151))
                (import (only (srfi 151) arithmetic-shift bitwise-ior))))
  (include "180.scm"))
