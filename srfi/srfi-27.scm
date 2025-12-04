; MODULE DEFINITION FOR SRFI-27
; =============================
;
; Sebastian.Egner@philips.com, Mar-2002, in Scheme 48 0.57
;
; This file contains the top-level definition for the 54-bit integer-only
; implementation of SRFI-27 for the Scheme 48 0.57 system. 
;
; 1. The core generator is implemented in 'mrg32k3a-a.scm'.
; 2. The generic parts of the interface are in 'mrg32k3a.scm'.
; 3. The non-generic parts (record type, time, error) are here.
;
; creating the module:
;   ,config ,load srfi-27-a.scm
;
; loading the module, once created:
;   ,open srfi-27
;
; history of this file:
;   SE, 22-Mar-2002: initial version
;   SE, 27-Mar-2002: checked again
;   Retropikzel, 12-Dec-2025: Made to work on R7RS

(define-library
  (srfi 27)
  (import (scheme base)
          (scheme write)
          (scheme complex)
          (scheme time))
  (export random-integer
          random-real
          default-random-source
          make-random-source
          random-source?
          random-source-state-ref
          random-source-state-set!
          random-source-randomize!
          random-source-pseudo-randomize!
          random-source-make-integers
          random-source-make-reals)
   (cond-expand
     (guile
       (import (only (guile) current-time))
       (begin (define (internal-random-source-current-time)
                (exact (floor (current-time))))))
     (else
       (begin (define (internal-random-source-current-time)
                (exact (floor (current-second)))))))
  (include "27.scm"))
