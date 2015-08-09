#lang racket

;; 表示一个原子(atom)
(quote a)

;; 原子的另一种表示方法
'a

;; 判断是否是一个原子
;;(atom 'a)
;;(eq 'a 'a)

;; 表示一个列表
'(a b c)

;; 返回列表的第一个元素
(car '(a b))

;; 返回列表除第一个元素外的所有其他元素
(cdr '(a b c))

;;返回 cons cell
(cons 'a 'b)
(cons 'a (cons 'b 'c))
(cons 'a (cons 'b '()))
(cons 'a (cons 'b (cons 'c '())))

;; atom eq cond 等操作符这里不支持
(display "Hello World!")

(define (hello) (display "Hello World!"))

(hello)