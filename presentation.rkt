; Copyright (C) 2022 Andreas Füglistaler
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at https://mozilla.org/MPL/2.0/.

#lang slideshow

(require slideshow/code)
(require pict/shadow)
(require slideshow/text)

(define (tt str)
  (text str (current-code-font) (current-font-size)))

(define (emph str)
  (colorize (bt str) "blue"))

(define (blue str)
  (colorize (tt str) "blue"))

(define (red str)
  (colorize (tt str) "red"))

(define (gray str)
  (colorize (tt str) "gray"))

(define (gt str)
  (colorize (t str) "gray"))

(define (pitem str)
  (item #:bullet (colorize (t "✔") "darkgreen") str))

(define (mitem str)
  (item #:bullet (colorize (t "x") "darkred") str))

(define (aitem str)
  (item #:bullet (arrowhead (/ gap-size 2) 0) str))

(define (eitem str)
  (item #:bullet (ghost (arrowhead (/ gap-size 2) 0)) str))

(current-main-font "comfortaa")
(current-code-font "Fantasque Sans Mono")
(current-title-color "darkgreen")
(current-gap-size 12)
(current-font-size 28)
(current-comment-color (current-id-color)) 

(slide
 #:name "Title"
 (shadow-frame (big (t "Estimating Sequencing Error Rates")))
 ;(hc-append (bt "Why") (t " and ") (bt "How"))
 (blank 50)
 (emph "Andreas Füglistaler, PhD")
 (t "Wegmann Group")
 (blank 50)
 (scale-to-fit (bitmap "imgs/unifr.png") (/ client-w 6) (/ client-h 6))
 )

(slide
 #:name "Calling Genotype"
 (shadow-frame (big (t "Calling Genotype")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (bt "Read") (bt "Base")
                        (t "1") (tt "A")
                        (t "2") (tt "G")
                        (t "3") (tt "T")
                        (t "4") (tt "A")
                        (t "5") (tt "A")
                        (t "6") (tt "G")
                        (t "7") (tt "G")
                        (t "8") (tt "A")
                        (t "9") (tt "A")
                        (t "10") (tt "G"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
(arrow 30 0)
  (ghost (para #:width 0.5 (hc-append (big (blue "  A")) (big (red "G")))
              ))))

(slide
 #:name "Calling Genotype"
 (shadow-frame (big (t "Calling Genotype")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (bt "Read") (bt "Base")
                        (t "1") (blue "A")
                        (t "2") (red "G")
                        (t "3") (gray "T")
                        (t "4") (blue "A")
                        (t "5") (blue "A")
                        (t "6") (red "G")
                        (t "7") (red "G")
                        (t "8") (blue "A")
                        (t "9") (blue "A")
                        (t "10") (red "G"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (arrow 30 0)
  (para #:width 0.5 (hc-append (big (blue "A")) (big (red "G"))))))


(slide
 #:name "Calling Genotype"
 (shadow-frame (big (t "Calling Genotype")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (bt "Read") (bt "Base")
                        (t "1") (tt "T"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (arrow 30 0)
  (para #:width 0.5 (hc-append (big (tt "AT, CT, GT ")) (big (t "?")))))
 (blank 50)
 'next 
 (emph "Is it even a T?"))

(slide
 #:name "Genotype Likelihoods"
 (shadow-frame (big (t "Genotype Likelihoods")))
 (emph "L(ab) = 0.5x(L(a) + L(b))")
 (ghost (emph ""))
 (ghost (emph ""))
 (blank 20)
 (hc-append
  30
  (frame (inset (table 2
                       (list
                        (bt "Read") (bt "Base")
                        (t "1") (tt "T"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (arrow 30 0)
  (para #:width 0.5
        (tt "A = ?")
        (tt "C = ?")
        (tt "G = ?")
        (tt "T = ?")
        (ghost(tt "T = 0.123456")))
  (arrow 30 0)
  (para #:width 0.5
        (tt "AA = ?")
        (tt "AC = ?")
        (tt "AG = ?")
        (tt "AT = ?")
        (tt "CC = ?")
        (tt "CG = ?")
        (tt "CT = ?")
        (tt "GG = ?")
        (tt "GT = ?")
        (tt "TT = ?")
        (ghost(tt "TT = 0.123456")))))

(slide
 #:name "Genotype Likelihoods"
 (shadow-frame (big (t "Genotype Likelihoods")))
 (emph "Assuming no Errors")
 (ghost (emph ""))
 (ghost (emph ""))
 (blank 20)
 (hc-append
  30
  (frame (inset (table 2
                       (list
                        (bt "Read") (bt "Base")
                        (t "1") (tt "T"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (arrow 30 0)
  (para #:width 0.5
        (tt "A = 0")
        (tt "C = 0")
        (tt "G = 0")
        (tt "T = 1")
        (ghost(tt "T = 0.123456")))
  (arrow 30 0)
  (para #:width 0.5
        (tt "AA = 0")
        (tt "AC = 0")
        (tt "AG = 0")
        (tt "AT = 0.5x(0 + 1)")
        (tt "CC = 0")
        (tt "CG = 0")
        (tt "CT = 0.5x(0 + 1)")
        (tt "GG = 0")
        (tt "GT = 0.5x(0 + 1)")
        (tt "TT = 1")
        (ghost(tt "TT = 0.123456789")))))


(slide
 #:name "Genotype Likelihoods"
 (shadow-frame (big (t "Genotype Likelihoods")))
 (emph "Assuming Prob(C-T) = 0.3")
 (ghost (emph ""))
 (ghost (emph ""))
 (blank 20)
 (hc-append
  30
  (frame (inset (table 2
                       (list
                        (bt "Read") (bt "Base")
                        (t "1") (tt "T"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (arrow 30 0)
  (para #:width 0.5
        (tt "A = 0")
        (tt "C = 0.3")
        (tt "G = 0")
        (tt "T = 1")
        (ghost(tt "T = 0.123456789")))
  (arrow 30 0)
  (para #:width 0.5
        (tt "AA = 0")
        (tt "AC = 0.5x(0 + 0.3)")
        (tt "AG = 0")
        (tt "AT = 0.5x(0 + 1)")
        (tt "CC = 0.3")
        (tt "CG = 0.5x(0 + 0.3)")
        (tt "CT = 0.5x(0.3 + 1)")
        (tt "GG = 0")
        (tt "GT = 0.5x(0 + 1)")
        (tt "TT = 1")
        (ghost(tt "TT = 0.123456789")))))

(slide
 #:name "Genotype Likelihoods"
 (shadow-frame (big (t "Genotype Likelihoods")))
 (emph "Assuming PMD(C-T) = 0.3")
 (emph "Assuming Sequencing Error eps = 0.05")
 (emph "Assuming rho(T-A) = 0.3, rho(T-C) = 0.2, rho(T-G) = 0.5")
 (blank 20)
 (hc-append
  30
  (frame (inset (table 2
                       (list
                        (bt "Read") (bt "Base")
                        (t "1") (tt "T"))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
  (arrow 30 0)
  (para #:width 0.5
        (tt "A = 0.05x0.3")
        (tt "C = 0.7x(0.05x0.2)")
        (tt "  + 0.3x(0.95x0.7)")
        (tt "G = 0.05x0.5")
        (tt "T = 0.95x0.7")
        (ghost(tt "T = 0.123456789")))
  (arrow 30 0)
  (para #:width 0.5
        (tt "AA = 0.015")
        (tt "AC = 0.11")
        (tt "AG = 0.02")
        (tt "AT = 0.34")
        (tt "CC = 0.20")
        (tt "CG = 0.12")
        (tt "CT = 0.44")
        (tt "GG = 0.025")
        (tt "GT = 0.35")
        (tt "TT = 0.66")
        (ghost(tt "TT = 0.123456789")))))
