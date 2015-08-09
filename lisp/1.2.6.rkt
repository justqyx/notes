#lang racket

(define (add_1 n)
  (lambda (f) (lambda (x) (f (( n f) x)))))

(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define three (lambda (f) (lambda (x) (f (f (f x))))))

;; 定义一个输出函数，让我们可以看到结果
(define f (lambda (x) (cons 'a x)))
(f '())

;((zero f) '())
;((one f) '())
;((two f) '())

(((add_1 two) f) '())

