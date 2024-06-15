(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
  (car (cdr s))
)

(define (caddr s)
  'YOUR-CODE-HERE
  (car (cddr s))
)


(define (sign num)
  'YOUR-CODE-HERE
  (cond 
    ((> 0 num) -1)
    ((= 0 num) 0)
    (else 1)
  )
)


(define (square x) (* x x))

(define (pow x y)
  (cond
    ((= y 0) 1)
    ((= 1 x) 1)
    ((= y 1) x)
    ((odd? y) 
      (* x (pow x (- y 1))))
    ((even? y) 
      (pow (square x) (quotient y 2)))
  )
)

