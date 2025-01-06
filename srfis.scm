; Remember to add SRFI to jenkins_script/test.sh too
(define srfis
  '(((number . 1) (depends (8)))
    ((number . 8))
    ;((number . 13) (depends . (8 14 60)))
    ;((number . 14) (depends . (60)))
    ;((number . 26))
    ;((number . 28))
    ((number . 38))
    ((number . 39))
    ((number . 48) (depends . (38)))
    ;((number . 60))
    ((number . 64) (depends . (1 39 48)))
    ))
