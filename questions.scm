(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement
(define (mapp p i)
    (if (null? i) nil)
    (cons p (car i) (map p (cdr i)))
)

(define (zip pairs)
  (cons (map (lambda (p) (car p)) pairs)
        (cons (map (lambda (p) (car (cdr p))) pairs) nil)))


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  (define (helper s num)
      (if (null? s) nil 
          (cons (cons num (cons (car s) nil))
                (helper (cdr s) (+ num 1))
                )
          ))
    (helper s 0)     
  )
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  (cond 
        ((null? list1) list2)
        ((null? list2) list1)
        ((comp (car list1) (car list2)) (cons (car list1) (merge comp (cdr list1) list2))) 
        ((comp (car list2) (car list1)) (cons (car list2) (merge comp list1 (cdr list2)))) 
      )
  )
  ; END PROBLEM 16

 
(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
    ; BEGIN PROBLEM 17


    (define (helper s num s2)
      (if (null? s) s2
            (if (< (car s) num) (helper (cdr s) (car s) (helper3 s2 (car s)))
                (helper (cdr s) (car s) (helper2 s2 (car s) 1)))
      )
    )


    (define (helper2 s added depth)
        (if (null? (car s))
            (list (list added))
        (if (null? (cdr s))
             (if (= 1 depth)
              (list (helper2 (car s) added 2))
              (cons (car s) (cons added nil)))
             (cons (car s) (helper2 (cdr s) added depth))
        )
        )
    )

    (define (helper3 s added)
        (if (null? (cdr s))
            (cons (car s) (cons (list added) nil))
            (cons (car s) (helper3 (cdr s) added))
        )
    )
(helper s -1 (list nil))
)



;(define s (list 1 2 3 1 2 2 1))

; Expected: ((1 2 3) (1 2 2) (1))
; Actual  : SchemeError: argument 0 of cdr has wrong type (nil)
;(print (nondecreaselist s))



    ; END PROBLEM 17

;; Problem EC
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM EC
        expr
         ; END PROBLEM EC
         )
        ((quoted? expr)
         ; BEGIN PROBLEM EC
        expr
         ; END PROBLEM EC
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
            (cons form (cons params (let-to-lambda (cddr expr))))
           ; END PROBLEM EC
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
            (cons (cons 'lambda (cons (car (zip (let-to-lambda values))) (let-to-lambda body))) (cadr (zip (let-to-lambda values))))
           ; END PROBLEM EC
           ))
        (else
         ; BEGIN PROBLEM EC
        (map let-to-lambda expr)
         ; END PROBLEM EC
         )))

