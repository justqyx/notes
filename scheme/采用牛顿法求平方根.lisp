; 问题描述
; √x = 那样的 y，使得 y 大于等于 0 而且 y 的平方根等于 x。

;(define (sqrt x)
;  (the y (and (>= y 0)
;              (= (square y) x))))

; 上面的过程性描述，只不过是重新提出了原来的问题。
; 在数学里，人们通常关心的是说明性的描述（是什么），
; 而在计算机科学里，人们通常关心的是行动性的描述（怎么做）。

; 尝试去描述一个解决问题的过程

;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;    guess
;    (sqrt-iter (improve guess x)
;               x)))
