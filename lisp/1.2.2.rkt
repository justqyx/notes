#lang racket
(define (count-change amount)
  (cc amount 5))

;;;将amount 换成 5 种货币的组合有多少
;;;不包含第一种货币的组合 — 包含第一种货币的组合，以此递归求得的结果就是要的结果

(define (cc amount kinds-of-coins)
  (cond ((= amount 1) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount(first-denomination kinds-of-coins)) kinds-of-coins)
              )
         )
  ))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)
   ))

(count-change 200)