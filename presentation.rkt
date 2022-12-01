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
 #:name "Genotype Likelihoods recal"
 (shadow-frame (big (t "Sequencing Errors")))
 (para #:width 0.5 (emph "Assuming PMD(C-T) = 0.3,")
 (emph "Sequencing Error = 0.05,")
 (emph "Sequecing Error Direction: A-T = 0.3, C-T = 0.2, G-T = 0.5"))
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
 #:name "ATLAS"
 (shadow-frame (big (t "ATLAS")))
 (hc-append (emph "A") (t "nalysis ") (emph "T") (t "ools for ") (emph "L") (t "ow-coverage and ") (emph "A") (t "ncient ") (emph "S") (t "amples"))
 (blank 20)
 (para (bt "48 Tasks"))
 (aitem "call, theta, inbreeding, GLF, majorMinor, ...")
 (blank 20)
 (eaitem "simulate")
 (eaitem "PMD")
 (eaitem "recal"))

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
 (para (small (tt "  --recal \"intercept;quality:empiric\"")))
 (para (small (tt "  --recal \"intercept;quality:probit\"")))
 (para (small (tt "  --recal \"intercept;quality;position;context;fragmentLength;mappingQuality\""))))

(slide
 #:name "Estimate theta"
 (shadow-frame (big (t "Estimate recal")))

 (para (small (tt "~/Git/atlas/build/atlas --task theta --bam *.bam")))
 (blank 50)
 (para (small (tt "~/Git/atlas/build/atlas --task theta --bam *.bam --pmd *_PMD.txt --recal *_recal.txt"))))

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
 (item #:bullet (arrow 20 0) "theta, inbreeding coefficient, ...")
 )
