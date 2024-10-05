; Testing related SRFI's must be first
; If SRFI is dependent on another SRFI it should be after it
(define srfis
  '(((number . 64))
    ((number . 8))
    ((number . 1))  ; Depends on 8
    ((number . 33))
    ((number . 14)) ; Depends on 13
    ))
