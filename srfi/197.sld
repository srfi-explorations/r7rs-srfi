;;; SPDX-FileCopyrightText: 2020 Adam R. Nelson <adam@nels.onl>
;;;
;;; SPDX-License-Identifier: MIT

(define-library
  (srfi 197)
  (import (scheme base)
          (srfi 2))
  (export chain
          chain-and
          chain-when
          chain-lambda
          nest
          nest-reverse)
  (include "197.scm"))
