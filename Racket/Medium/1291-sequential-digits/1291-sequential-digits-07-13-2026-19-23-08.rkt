(define (sequential-digits low high)
  (define digits "123456789")
  (define result '())

  (for ([len (in-range 2 10)])
    (for ([start (in-range 0 (- 10 len))])
      (define num
        (string->number
         (substring digits start (+ start len))))
      (when (and (>= num low) (<= num high))
        (set! result (append result (list num))))))

  result)