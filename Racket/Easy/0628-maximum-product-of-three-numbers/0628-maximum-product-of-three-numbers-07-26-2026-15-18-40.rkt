(define (maximum-product nums)
  (define s (sort nums <))
  (define n (length s))

  (max
   (* (list-ref s (- n 1))
      (list-ref s (- n 2))
      (list-ref s (- n 3)))
   (* (list-ref s 0)
      (list-ref s 1)
      (list-ref s (- n 1)))))