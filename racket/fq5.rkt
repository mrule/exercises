;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname fq5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *****************************************************************************
;;   Madeline Rule (20857141)
;;   CS 115 Spring 2020
;;   Final Exam, Question 5
;; *****************************************************************************
;;

(define-struct node (key val left right))
;; A binary search tree (BST) is either
;;   '() or
;;   (make-node Nat Any BST BST)...
;; which satisfies the ordering property recursively:
;;   every key in left is less than key
;;   every key in right is greater than k

(define sample-bst
  (make-node 7 "seven"
    (make-node 4 "four"
      (make-node 2 "two" '() '())
      (make-node 6 "six" '() '()))
    (make-node 10 "ten"
      (make-node 9 "nine" '() '())
      (make-node 12 "twelve" '() '()))))


;; (search-path abst target) consumes a BST and a Nat, returns a list containing
;;  all keys that it visits while searching efficiently for target in abst
;; search-path: BST Nat -> (listof Nat)
;; Examples:
(check-expect (search-path sample-bst 4) (list 7 4))
(check-expect (search-path sample-bst 0) (list 7 4 2))
(check-expect (search-path sample-bst 11) (list 7 10 12))
(check-expect (search-path sample-bst 6) (list 7 4 6))

(define (search-path abst target)
  (cond [(equal? target (node-key abst)) (list (node-key abst))]
        [(and (empty? (node-left abst)) (empty? (node-right abst)))
         (list (node-key abst))]
        [(equal? target (node-key (node-left abst)))
         (list (node-key abst) (node-key (node-left abst)))]
        [(equal? target (node-key (node-right abst)))
         (list (node-key abst) (node-key (node-right abst)))]
        [(> target (node-key (node-right abst)))
         (cons (node-key abst) (search-path (node-right abst) target))]
        [(< target (node-key (node-left abst)))
         (cons (node-key abst) (search-path (node-left abst) target))]
        [(< (abs (- target (node-key (node-left abst))))
            (abs (- target (node-key (node-right abst)))))
         (cons (node-key abst) (search-path (node-left abst) target))]
        [(> (abs (- target (node-key (node-left abst))))
            (abs (- target (node-key (node-right abst)))))
         (cons (node-key abst) (search-path (node-right abst) target))]
        ))

;; Tests:
(check-expect (search-path sample-bst 7) (list 7))
(check-expect (search-path sample-bst 9) (list 7 10 9))
(check-expect (search-path sample-bst 3) (list 7 4 2))