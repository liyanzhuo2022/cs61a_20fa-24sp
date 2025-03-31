(define (ascending? s) 
  (if (or (null? s) (null? (cdr s))) 
      #t
      (if (> (car s) (car (cdr s)))
          #f
          (ascending? (cdr s)))))


(define (my-filter pred s) 
  (cond 
    ((null? s) '())
    ((pred (car s)) (cons (car s) (my-filter pred (cdr s))))
    (else (my-filter pred (cdr s)))))


(define (interleave lst1 lst2) 
  (cond
    ((null? lst1) lst2)
    ((null? lst2) lst1)
    (else (cons (car lst1) (cons (car lst2) (interleave (cdr lst1) (cdr lst2))))) 
    ))


(define (exist-in-list? x lst) 
   (not (null? (filter (lambda (y) (equal? x y)) lst)))
)

(define (no-repeats-helper s seen)
  (cond
    ((null? s) seen)
    ((exist-in-list? (car s) seen)
     (no-repeats-helper (cdr s) seen))
     (else (no-repeats-helper (cdr s) (append seen (list (car s))))))
)


(define (no-repeats s) 
  (no-repeats-helper s '())
)
