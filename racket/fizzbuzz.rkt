;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname fizzbuzz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ****************************************
;;   Madeline Rule 2020
;;   The FizzBuzz Question
;;   mrule@uwaterloo.ca
;; ****************************************

(define (fizzbuzz? x)
  (cond [(integer? (/ x 15)) "FizzBuzz"]
        [(integer? (/ x 5)) "Buzz"]
        [(integer? (/ x 3)) "Fizz"]
        [else x]))
(map fizzbuzz? (range 1 101 1))
