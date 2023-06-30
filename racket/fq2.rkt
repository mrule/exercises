;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname fq2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *****************************************************************************
;;   Madeline Rule (20857141)
;;   CS 115 Spring 2020
;;   Final Exam, Question 2
;; *****************************************************************************
;;

;; (rotate-right L) consumes a non-empty list of anything, returns the same list
;;  but with the last item moved to the front
;; rotate-right: (listof Any) -> (listof Any)
;; Requires: L is not empty
;; Examples:
(check-expect (rotate-right (list 2 9 6 3 5 7)) (list 7 2 9 6 3 5))
(check-expect (rotate-right (list 3)) (list 3))
(check-expect (rotate-right (list "how" "are" "you")) (list "you" "how" "are"))

(define (rotate-right L)
  (local [(define (last-term l) (cond [(empty? (rest l)) (first l)]
                                      [else (last-term (rest l))]))
          (define (add-first l) (cons (last-term l) l))
          (define (remove-last l) (cond [(empty? (rest l)) '()]
                                        [else (cons (first l)
                                                    (remove-last (rest l)))]))
          ]
    (remove-last (add-first L))))

;; Tests:
(check-expect (rotate-right (list (list 1) (list 2) (list 3)))
              (list (list 3) (list 1) (list 2)))
(check-expect (rotate-right (list "race" "car")) (list "car" "race"))
(check-expect (rotate-right (list 1 2 3 4 5 6 7 8 9 0))
              (list 0 1 2 3 4 5 6 7 8 9))
