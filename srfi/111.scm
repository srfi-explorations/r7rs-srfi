(define-record-type box-type
  (box value)
  box?
  (value unbox set-box!))
