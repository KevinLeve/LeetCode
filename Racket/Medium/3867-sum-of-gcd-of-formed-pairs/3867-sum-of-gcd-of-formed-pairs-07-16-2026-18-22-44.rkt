(define (gcd-sum nums)
  (define (build lst mx acc)
    (if (null? lst)
        (reverse acc)
        (let* ([x (car lst)]
               [new-mx (max mx x)])
          (build (cdr lst)
                 new-mx
                 (cons (gcd x new-mx) acc)))))

  (define vec
    (list->vector
     (sort (build nums 0 '()) <)))

  (define n (vector-length vec))

  (define (pair l r ans)
    (if (>= l r)
        ans
        (pair (+ l 1)
              (- r 1)
              (+ ans
                 (gcd (vector-ref vec l)
                      (vector-ref vec r))))))

  (pair 0 (- n 1) 0))