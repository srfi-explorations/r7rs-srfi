; Testing related SRFI's must be first
; If SRFI is dependent on another SRFI it should be after it
(define srfis
  '(((number . 8))
    ((number . 1)) ; Depends on 8
    ((number . 14))
    ((number . 26))
    ((number . 28))
    ((number . 64)) ; Depends on 1, 26, 28
    ;((number . 71)) ; No tests yet
    ((number . 151))
    ))
