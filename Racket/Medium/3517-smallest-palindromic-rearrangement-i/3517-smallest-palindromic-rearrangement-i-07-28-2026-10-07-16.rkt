(define (smallest-palindrome s)
  (define cnt (make-vector 26 0))

  (for ([c (in-string s)])
    (define i (- (char->integer c) (char->integer #\a)))
    (vector-set! cnt i (add1 (vector-ref cnt i))))

  (define left "")
  (define mid "")

  (for ([i (in-range 26)])
    (set! left
          (string-append
           left
           (make-string (quotient (vector-ref cnt i) 2)
                        (integer->char (+ i (char->integer #\a))))))

    (when (odd? (vector-ref cnt i))
      (set! mid
            (string (integer->char (+ i (char->integer #\a))))))
  )

  (string-append left mid (list->string (reverse (string->list left)))))