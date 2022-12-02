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
  (item #:bullet (arrowhead (/ gap-size 2) 0) (bt str)))

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
 (shadow-frame (big (t "Genotype Likelihood Estimation")))
 ;(hc-append (bt "Why") (t " and ") (bt "How"))
 (blank 50)
 (bt "Andreas Füglistaler, PhD")
 (t "Wegmann Group")
 (blank 50)
 (scale-to-fit (bitmap "imgs/unifr.png") (/ client-w 6) (/ client-h 6))
 )

(slide
 #:name "Calling Genotype 10"
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
  (ghost (para #:width 0.5 (hc-append (big (blue "A")) (big (red "G")))
              ))))

(slide
 #:name "Calling Genotype 10"
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
 #:name "Calling Genotype 1"
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
  (para #:width 0.5 (hc-append (big (tt "AT, CT, GT, TT ")) (big (t "?")))))
 (blank 50)
 (emph "Is it even a T?"))

(slide
 #:name "Likelihoods"
 (shadow-frame (big (t "Likelihoods")))
 (para (bt "Base Likelihoods:") (tt " L(A), L(C), L(G), L(T)")
 (bt "Genotype Likelihood:") (tt " L(ab) = 0.5x[L(a) + L(b)]"))
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
        (tt "L(A) = ?")
        (tt "L(C) = ?")
        (tt "L(G) = ?")
        (tt "L(T) = ?"))
  (arrow 30 0)
  (para #:width 0.5
        (tt "L(AA) = ?")
        (tt "L(AC) = ?")
        (tt "L(AG) = ?")
        (tt "L(AT) = ?")
        (tt "L(CC) = ?")
        (tt "L(CG) = ?")
        (tt "L(CT) = ?")
        (tt "L(GG) = ?")
        (tt "L(GT) = ?")
        (tt "L(TT) = ?"))))

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
        (tt "L(A) = 0")
        (tt "L(C) = 0")
        (tt "L(G) = 0")
        (tt "L(T) = 1"))
  (arrow 30 0)
  (para #:width 0.5
        (tt "L(AA) = 0")
        (tt "L(AC) = 0")
        (tt "L(AG) = 0")
        (tt "L(AT) = 0.5x(0 + 1)")
        (tt "L(CC) = 0")
        (tt "L(CG) = 0")
        (tt "L(CT) = 0.5x(0 + 1)")
        (tt "L(GG) = 0")
        (tt "L(GT) = 0.5x(0 + 1)")
        (tt "L(TT) = 1"))))

(slide
 #:name "Post Mortem Damage"
 (shadow-frame (big (t "Post Mortem Damage")))
 (para (t "Deamination of cytosine to uracil: ") (tt "C→U"))
 (para (t "Uracil will be read as Thymin: ") (tt "C→U→T"))
 (blank 20)
 (para (bt "Probability of") (tt " C→T ") (bt "transition"))
 (para (tt "     p") (t " = Distance from 5' read end"))
 (para (tt "PMD(p) = a*exp(-b*p) + c"))
 (scale-to-fit (bitmap "imgs/PMD_flat.png") (* client-w 0.9) (/ client-h 1))
 )

(slide
 #:name "Genotype Likelihoods PMD"
 (shadow-frame (big (t "Genotype Likelihoods with PMD")))
 (emph "Assuming PMD(C→T) = 0.3")
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
        (tt "L(A) = 0")
        (tt "L(C) = 0.3")
        (tt "L(G) = 0")
        (tt "L(T) = 1"))
  (arrow 30 0)
  (para #:width 0.5
        (tt "L(AA) = 0")
        (tt "L(AC) = 0.5x(0 + 0.3)")
        (tt "L(AG) = 0")
        (tt "L(AT) = 0.5x(0 + 1)")
        (tt "L(CC) = 0.3")
        (tt "L(CG) = 0.5x(0.3 + 0)")
        (tt "L(CT) = 0.5x(0.3 + 1)")
        (tt "L(GG) = 0")
        (tt "L(GT) = 0.5x(0 + 1)")
        (tt "L(TT) = 1"))))

(slide
 #:name "Sequencing Errors"
 (shadow-frame (big (t "Sequencing Errors")))
 (para (t "Reported error probability by sequencing machine: ")
       (tt "Q = -10xlog(E)"))
 (para
  (aitem "Not very accurate")
  (aitem "Needs recalibration"))
 (blank 20)
 (para (bt "recal"))
 (para (tt "R = F(Q, p, mappingQuality, fragmentLength, context)  "))
 (blank 10)
 (para (bt "If an error happens, then:")
       (para (tt "ρ = [[-, A→C, A→G, A→T],"))
       (para (tt "     [C→A, -, C→G, C→T],"))
       (para (tt "     [G→A, G→C, -, G→T],"))
       (para (tt "     [T→A, T→C, T→G, -]]"))))

(slide
 #:name "Sequencing Errors plot"
 (scale-to-fit (bitmap "imgs/recal.png") (* client-w 0.9) (/ client-h 1))
 )

(slide
 #:name "Genotype Likelihoods recal"
 (shadow-frame (big (t "Genotype Likelihoods with Recal")))
 (para (emph "Assuming:"))
 (para (t "PMD(C→T) = 0.3, Sequencing Error = 0.05")
 (t "ρ(A→T) = 0.3, ρ(C→T) = 0.2, ρ(G→T) = 0.5"))
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
        (tt "L(A) = 0.3x0.05")
        (tt "L(C) = 0.7x(0.2x0.05)")
        (tt "       + 0.3x(0.95)")
        (tt "L(G) = 0.5x0.05")
        (tt "L(T) = 0.95"))
  (arrow 30 0)
  (para #:width 0.5
        (tt "L(AA) = 0.015")
        (tt "L(AC) = 0.11")
        (tt "L(AG) = 0.02")
        (tt "L(AT) = 0.48")
        (tt "L(CC) = 0.20")
        (tt "L(CG) = 0.12")
        (tt "L(CT) = 0.58")
        (tt "L(GG) = 0.025")
        (tt "L(GT) = 0.48")
        (tt "L(TT) = 0.95"))))

(slide
 #:name "ATLAS"
 (shadow-frame (big (t "ATLAS")))
 (hc-append (emph "A") (t "nalysis ") (emph "T") (t "ools for ") (emph "L") (t "ow-coverage and ") (emph "A") (t "ncient ") (emph "S") (t "amples"))
 (blank 20)
 (para (bt "48 Tasks"))
 (aitem "call, theta, inbreeding, GLF, majorMinor, ...")
 (blank 20)
 (eaitem "Simulate data")
 (eaitem "Estimate PMD")
 (eaitem "Estimate recal"))

(slide
 #:name "Simulation"
 (shadow-frame (big (t "Simulation")))

 (para (small (tt "~/Git/atlas/build/atlas --task simulate --ploidy 2,2,1"))
 (small (tt "  --pmd \"doubleStrand:Exponential[50,0.5,0.1,0.01]:Exponential[50,0.5,0.1,0.01]\""))
 (small (tt "  --recal \"intercept[0.1];quality:polynomial[0.8,-0.05]\"")))
 (blank 20)
 (hc-append (scale-to-fit (bitmap "imgs/PMD.png") (/ client-w 2) (/ client-h 1))
            (scale-to-fit (bitmap "imgs/recal.png") (/ client-w 2) (/ client-h 1))))

(slide
 #:name "Estimate PMD"
 (shadow-frame (big (t "Estimate PMD")))

 (para (small (tt "~/Git/atlas/build/atlas --task PMD --bam *.bam --fasta *.fasta"))
 (small (tt "  --pmdModels \"doubleStrand:Exponential:Exponential\"")))
 (blank 10)
 (bt "also possible")
 (blank 10)
 (para (small (tt "  --pmdModels \"singleStrand:Empiric:Empiric\"")))
 )

(slide
 #:name "Estimate recal"
 (shadow-frame (big (t "Estimate recal")))

 (para (small (tt "~/Git/atlas/build/atlas --task recal --bam *.bam  --regions chr3.bed"))
 (small (tt "  --pmd *_PMD.txt --recal \"intercept;quality:polynomial2\"")))
 (blank 10)
 (bt "also possible")
 (blank 10)
 (para (small (tt "  --recal \"intercept;quality:empiric\""))
 (small (tt "  --recal \"intercept;quality;position;context;fragmentLength;mappingQuality\""))
 (small (tt "  --recal \"intercept;quality:polynomial3;fragmentLength:probit;context\""))))

(slide
 #:name "Estimate theta"
 (shadow-frame (big (t "Estimate recal")))

 (para (small (tt "~/Git/atlas/build/atlas --task theta --bam *.bam")))
 (blank 50)
 (para (small (tt "~/Git/atlas/build/atlas --task theta --bam *.bam"))
 (small (tt "  --pmd *_PMD.txt --recal *_recal.txt"))))

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
 (aitem "theta, inbreeding coefficient, ...")
 )
