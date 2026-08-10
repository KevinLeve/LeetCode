(define (winner-square-game n)
  (define dp (make-vector (+ n 1) #f))

  (for ([i (in-range 1 (+ n 1))])
    (define win #f)

    (for ([j (in-range 1 (+ 1 (integer-sqrt i)))])
      (when (and (not win)
                 (not (vector-ref dp (- i (* j j)))))
        (set! win #t)))

    (vector-set! dp i win))

  (vector-ref dp n))