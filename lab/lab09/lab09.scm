; (define (over-or-under num1 num2) 
;   (if (< num1 num2) 
;     -1
;     (if (> num1 num2) 
;       1 
;       0)))

(define (over-or-under num1 num2)
  (cond 
    ((< num1 num2) -1)
    ((= num1 num2) 0)
    (else 1) )) 

(define (make-adder num) 
  (lambda (inc) (+ num inc)))

(define (composed f g) 
  (lambda (x) (f (g x))))

(define (repeat f n) 
  (define (new_proc x)
    (if (= n 1)
      (f x)
      ((composed f (repeat f (- n 1))) x)))
  new_proc)

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

; (define (gcd a b)
;   (if (= (modulo (max a b) (min a b)) 0)
;     (min a b)
;     (gcd (min a b) (modulo (max a b) (min a b)))))

(define (gcd a b)
  (if (= b 0)   ; 终止条件：如果 b 为 0，则返回 a
      a
      (gcd b (modulo a b))))  ; 递归调用
