(define (array-rank-transform arr)
  (define rank-by-num
    (for/hash ([num (in-list (remove-duplicates (sort arr <) eq?))]
               [rank (in-naturals 1)])
      (values num rank)))

  (map (curry hash-ref rank-by-num) arr))