(define (two-sum nums target)
  (define ht (make-hash))

  (let loop ([lst nums] [i 0])
    (cond
      [(null? lst) '()]
      [else
       (define num (car lst))
       (define need (- target num))
       (cond
         [(hash-has-key? ht need)
          (list (hash-ref ht need) i)]
         [else
          (hash-set! ht num i)
          (loop (cdr lst) (add1 i))])])))