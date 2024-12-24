; If SRFI is dependent on another SRFI it should be after it
(define srfis
  '(((number . 8))
    ((number . 1)) ; Depends on 8
    ((number . 14))
    ((number . 26))
    ((number . 28))
    ((number . 39))
    ((number . 13)) ; Depends on 8, 14, 33
    ((number . 60))
    ((number . 64)) ; Depends on 1, 8, 26, 28
    ))
