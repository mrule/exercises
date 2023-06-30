;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname fq3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *****************************************************************************
;;   Madeline Rule (20857141)
;;   CS 115 Spring 2020
;;   Final Exam, Question 3
;; *****************************************************************************
;;

; machen: add k to each item in L, then returns a list of only the even terms,
; multiplied by two
;(define (machen L k)
;  (foldr (lambda (a b)
;           (cond [(odd? a) b]
;                 [else (cons (* 2 a) b)]))
;         '()
;         (map (lambda (x) (+ x k)) L)))


(define (machen2 L k)
  (local [(define (shorten l k)
            (cond [(odd? k) (filter odd? L)]
                  [(even? k) (filter even? L)]))
          (define (manip l k)
            (cond [(empty? l) '()]
                  [(empty? (rest l)) (list (* 2 (+ k (first l))))]
                  [else (cons (* 2 (+ k (first l))) (manip (rest l) k))]))
          ]
    (manip (shorten L k) k)))

;; Tests:
(check-expect (machen2 (list 1 2 3 4 5 6 7 8 9) 2) (list 8 12 16 20))
(check-expect (machen2 (list 50 40 30 20 10 0) 100)
              (list 300 280 260 240 220 200))