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

(define (eaitem str)
  (item #:bullet (arrowhead (/ gap-size 2) 0) (emph str)))

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
 (shadow-frame (big (t "Estimating Sequencing Error")))
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
 (emph "L(ab) = 0.5x[L(a) + L(b)]")
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
        (ghost(tt "C = 0.7x(0.2x0.05)")))
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
        (ghost(tt "CG = 0.5x(0 + 0.3)")))))

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
        (ghost(tt "C = 0.7x(0.2x0.05)")))
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
        (ghost(tt "CG = 0.5x(0 + 0.3)")))))


(slide
 #:name "Genotype Likelihoods PMD"
 (shadow-frame (big (t "Post Mortem Dammage")))
 (emph "Assuming PMD(C-T) = 0.3")
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
        (ghost(tt "C = 0.7x(0.2x0.05)")))
  (arrow 30 0)
  (para #:width 0.5
        (tt "AA = 0")
        (tt "AC = 0.5x(0 + 0.3)")
        (tt "AG = 0")
        (tt "AT = 0.5x(0 + 1)")
        (tt "CC = 0.3")
        (tt "CG = 0.5x(0.3 + 0)")
        (tt "CT = 0.5x(0.3 + 1)")
        (tt "GG = 0")
        (tt "GT = 0.5x(0 + 1)")
        (tt "TT = 1")
        (ghost(tt "CG = 0.5x(0 + 0.3)")))))

(slide
 #:name "Genotype Likelihoods eps"
 (shadow-frame (big (t "Sequencing Errors")))
 (emph "Assuming PMD(C-T) = 0.3,")
 (emph "Sequencing Error eps = 0.05,")
 (emph "rho(A-T) = 0.3, rho(C-T) = 0.2, rho(G-T) = 0.5")
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
        (tt "A = 0.3x0.05")
        (tt "C = 0.7x(0.2x0.05)")
        (tt "    + 0.3x(0.95)")
        (tt "G = 0.5x0.05")
        (tt "T = 0.95")
        (ghost(tt "C = 0.7x(0.2x0.05)")))
  (arrow 30 0)
  (para #:width 0.5
        (tt "AA = 0.015")
        (tt "AC = 0.11")
        (tt "AG = 0.02")
        (tt "AT = 0.48")
        (tt "CC = 0.20")
        (tt "CG = 0.12")
        (tt "CT = 0.58")
        (tt "GG = 0.025")
        (tt "GT = 0.48")
        (tt "TT = 0.95")
        (ghost(tt "CG = 0.5x(0 + 0.3)")))))

(slide
 #:name "Calculating Genotype Likelihoods"
 (shadow-frame (big (t "Calculating Genotype Likelihoods")))
 (para (emph "1. Estimate PMD"))
 (aitem "Compare to reference")
 (aitem "Assume symetric mutations")
 (item #:bullet (bt "Covariate:") "Position")
 (blank 10)
 (para (emph "2. Estimate Sequencing Errors"))
 (aitem "Use monomorphic/haploid sites")
 (item #:bullet (bt "Covariates:") " Sequencing quality, Mapping quality, Context, Position, Fragment length")
 (blank 10)
 (para (emph "3. Estimate Genotype Likelihoods"))
 (aitem "Calculate theta, Fst, inbreeding coefficient, ...")
 )

(slide
 #:name "ATLAS"
 (shadow-frame (big (t "ATLAS")))
 (emph "Analysis Tools for Low-coverage and Ancient Samples")
 (blank 20)
 (para (bt "48 Tasks"))
 (aitem "PMD, call, theta, inbreeding, GLF, majorMinor, ...")
 (eaitem "simulate")
 (eaitem "recal"))
