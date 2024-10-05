; Testing related SRFI's must be first
; If SRFI is dependent on another SRFI it should be after it
(define srfis
  '(((number . 8))
    ((number . 1)) ; Depends on 8
    ((number . 64))))
