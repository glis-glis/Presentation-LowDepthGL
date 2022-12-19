; Copyright (C) 2022 Andreas Füglistaler
; This Source Code Form is subject to the terms of the Mozilla Public
; License, v. 2.0. If a copy of the MPL was not distributed with this
; file, You can obtain one at https://mozilla.org/MPL/2.0/.

#lang slideshow

(require slideshow/code)
(require pict/shadow)
(require slideshow/text)
(require plot)

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
(plot-font-face (current-code-font))

(define (logit x) (- (log x) (log (- 1 x))))
(define (T x) (logit (expt 10 (/ (- x) 10))))
(define (expit x) (/ (exp x) (+ 1 (exp x))))

(slide
 #:name "Title"
 (shadow-frame (para #:align 'center (big (t "Estimating Genotype Likelihoods"))
                     (blank 50)
                     (hc-append (t "Low-Depth") (t " and ") (t "Ancient") (t " DNA"))))
 (blank 50)
 (bt "Andreas Füglistaler, PhD")
 (t "Wegmann Group")
 (blank 50)
 (scale-to-fit (bitmap "imgs/unifr.png") (/ client-w 6) (/ client-h 6))
 )

(slide
 #:name "High-Depth DNA"
 (shadow-frame (big (t "High-Depth DNA")))
 (small (para #:width 0.7 #:align 'center
         (hc-append (tt "01 TCTAGCGCT") (blue "A") (gray "T") (tt "GGAGTCTT...GCTGGC         "))
         (hc-append (tt "02  CTAGCGCT") (blue "A") (red "G") (tt "GGAGTCTT...GCTGGCG        "))
         (hc-append (tt "03   TCGCGCT") (blue "A") (blue "A") (tt "GGAGTCAT...GCTGGCGA       "))
         (hc-append (tt "04    ATCGCT") (blue "A") (blue "A") (tt "GGAGTCTT...GCTGGCGAC      "))
         (hc-append (tt "05     GCGCT") (blue "A") (blue "A") (tt "GGAGTCTT...GCTGGCGACA     "))
         (hc-append (tt "06      CGCT") (blue "A") (red "G") (tt "GGCGTCTT...GCTGGCGACAG    "))
         (hc-append (tt "07       GCT") (gray "C") (red "G") (tt "GGAGTCTT...GCTGGCGACAGG   "))
         (hc-append (tt "08        CT") (blue "A") (blue "A") (tt "GGAGTCTT...GAGAGAGAGAGAG  "))
         (hc-append (tt "09         T") (blue "A") (blue "A") (tt "GGAGTCTT...GCTGGCGACAGGCA "))
         (hc-append (tt "10          ") (blue "A") (red "G") (tt "GGAGTCTT...GCTGGCGACAGGCAG"))
         (tt "             .")
         (tt "             .")
         (tt "             ."))))

(slide
 #:name "Low-Depth DNA"
 (shadow-frame (big (t "Low-Depth DNA")))
 (small (para #:width 0.9 #:align 'center
         (hc-append (tt "01 TCTAGCGCT") (blue "A") (red "T") (tt "GGAGTCTT...GCTGGC            "))
         (hc-append (tt "02  CTAGCGCT") (blue "A") (tt "                              "))
         (hc-append (tt "03            ") (tt "      TT...GCTGGCGACA        "))
         (hc-append (tt "04            ") (tt "           GCTGGCGACAGGCAG   "))
         (hc-append (tt "05            ") (tt "                    AGGCAG...")))))


(slide
 #:name "Calling Genotype 10"
 (shadow-frame (big (t "Calling Genotype")))
 (hc-append
  100
  (frame (inset (table 2
                       (list
                        (bt "Read") (bt "Base")
                        (t "1") (tt "T")
                        (t "2") (tt "G")
                        (t "3") (tt "A")
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
                        (t "1") (gray "T")
                        (t "2") (red "G")
                        (t "3") (blue "A")
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
 (bt "Genotype Likelihood:") (tt " L(ab) = 0.5×[L(a) + L(b)]"))
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
 (shadow-frame (big (t "Likelihoods")))
 (emph "Assuming no Errors")
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
        (tt "L(AT) = 0.5×(0 + 1)")
        (tt "L(CC) = 0")
        (tt "L(CG) = 0")
        (tt "L(CT) = 0.5×(0 + 1)")
        (tt "L(GG) = 0")
        (tt "L(GT) = 0.5×(0 + 1)")
        (tt "L(TT) = 1"))))

(slide
 #:name "Post-Mortem Damage"
 (shadow-frame (big (t "Post-Mortem Damage")))
 (para (t "Deamination of Cytosine to Uracil: C→U"))
 (para (t "Uracil will be read as Thymine: C→U→T"))
 (blank 20)
 (para (emph "Estimation of  C→T transition")
 (t "Position: Distance from 5' read end")
 (t "For every C in the reference, count occurrence in data")
 (aitem "Number of C→T per position")
 (aitem "Total number of Cs per position"))
 (blank 10)
 (para (tt "PMD(C→T, p) = Number(C→T, p)/tot(C, p)"))
 (blank 10)
 (aitem "Either empiric values or fit exponential function")
 (aitem "(Same for G→A from 3' if paired ended reads)"))

(slide
 #:name "Post-Mortem Damage plot"
 (shadow-frame (big (t "Post-Mortem Damage")))
 (plot-pict (function (lambda (x) (+ 0.01 (* 0.5 (exp (* -0.1 x))))) 0 100
                      #:label "0.5×exp(-0.1×p) + 0.01"
                      #:width 3)
            #:width (* client-w 0.75)
            #:aspect-ratio 2
            #:y-max 0.6
            #:x-label "Distance from 5' read end"
            #:y-label "C→T probability"
            )
 )

(slide
 #:name "Genotype Likelihoods PMD"
 (shadow-frame (big (t "Likelihoods with PMD")))
 (emph "Assuming PMD(C→T) = 0.3")
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
        (tt "L(AC) = 0.5×(0 + 0.3)")
        (tt "L(AG) = 0")
        (tt "L(AT) = 0.5×(0 + 1)")
        (tt "L(CC) = 0.3")
        (tt "L(CG) = 0.5×(0.3 + 0)")
        (tt "L(CT) = 0.5×(0.3 + 1)")
        (tt "L(GG) = 0")
        (tt "L(GT) = 0.5×(0 + 1)")
        (tt "L(TT) = 1"))))

(slide
 #:name "Sequencing Errors"
 (shadow-frame (big (t "Sequencing Errors")))
 (para (t "Reported error probability by sequencing machine: "))
       (cc-superimpose 
 (plot-pict (function (lambda (x) (expit (T x))) 0 100
                      #:width 2)
            #:width (* client-w 0.75)
            #:height (* client-w 0.25)
            #:aspect-ratio 3
            #:x-label "Q: Quality score"
            #:y-label "𝜀: Error Probability") (tt "Q = -10xlog(𝜀)"))

(blank 20)
 (para
  (mitem "Not very accurate")
  (mitem "Needs recalibration")))

(slide
 #:name "Sequencing Errors Recalibration"
 (shadow-frame (big (t "Sequencing Errors Recalibration")))
 (emph "Use monomorphic/haploid sites")
 (blank 50)
 (para (tt "𝜀 = logistic[f0 + f1(qualityScore) ")
       (tt "  + f2(position) + f3(mappingQuality)")
       (tt "  + f4(fragmentLength)+ f5(previousBase)]")
       (tt "                               ")
       (tt "f = polynomial, empiric, probit or 0")
       (tt "                              ")
       (tt "𝜌 = [[-, A→C, A→G, A→T],[C→A, -, C→G, C→T],")
       (tt "    [G→A, G→C, -, G→T],[T→A, T→C, T→G, -]]"))
       (blank 20)
       (para (emph "Expectation–maximization (EM) algorithm")
             (t "Maximize ")(tt "Sum[log(GenotypeLikelihoods)]")))


(slide
 #:name "Sequencing Errors plot"
 (shadow-frame (big (t "Sequencing Errors")))

 (plot-pict (list (function (lambda (x) (expit (T x))) 0 100
                      #:label "f1 = logistic(Q)"
                      #:color 2
                      #:width 2)
(function (lambda (x) (expit (+ 0.01 (* 0.8 (T x)) (* -0.05 (T x) (T x))))) 0 100
                      #:label "f2 = logistic(0.01 + 0.8×Q -0.05×Q²)"
                      #:color 4
                      #:width 2))
            #:width (* client-w 0.75)
            #:height (* client-w 0.25)
            #:aspect-ratio 3
            #:x-label "Quality score"
            #:y-label "Error Probability")

 (plot-pict (list (function (lambda (x) (* -10 (log (expit (T x)) 10))) 0 100
                      #:color 2
                      #:width 2)
(function (lambda (x) (* -10 (log (expit (+ 0.01 (* 0.8 (T x)) (* -0.05 (T x) (T x)))) 10))) 0 100
                      #:color 4
                      #:width 2))
            #:width (* client-w 0.75)
            #:height (* client-w 0.25)
            #:aspect-ratio 3
            #:x-label "Quality score"
            #:y-label "Recalibrated Quality"))

(slide
 #:name "Genotype Likelihoods recal"
 (shadow-frame (big (t "Genotype Likelihoods with Recal")))
 (para (emph "Assuming:"))
 (para (t "PMD(C→T) = 0.3, 𝜀  = 0.05")
 (t "𝜌(A→T) = 0.3, 𝜌(C→T) = 0.2, 𝜌(G→T) = 0.5"))
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
        (tt "L(A) = 0.3×0.05")
        (tt "L(C) = 0.7×(0.2×0.05)")
        (tt "       + 0.3×(0.95)")
        (tt "L(G) = 0.5×0.05")
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
 (eaitem "Estimate sequencing error recalibration"))

(slide
 #:name "Implementation Inheritance"
 (shadow-frame (big (t "Implementation Inheritance")))
 (frame (with-scale 0.85 (codeblock-pict
         "class Recal {
  virtual double f_quality(Quality q) {return empiric(q);}
  virtual couble f_context(Context c) {return empiric(c);}
public:
  double probability(Data d)
    {return logistic(f_quality(d.Q) + f_context(d.C));}
};")))
 (cc-superimpose (pip-arrow-line 40 40 20)
 (pip-arrow-line -40 40 20))
 (blank 20)
 (hc-append 20
            (frame (with-scale 0.85 (codeblock-pict
                    "class RecalPolyQ : Recal {
  double f_quality(Quality q) override
    {return polynomial(q);}
};")))
            
            (frame (with-scale 0.85 (codeblock-pict
                    "class RecalPolyC  : Recal {
  double f_context(Context c) override
    {return polynomial(c);}
};"))))
(hc-append 80 (pip-arrow-line 40 40 20) (pip-arrow-line -40 40 20))
 (blank 20)
 (frame (with-scale 0.85 (codeblock-pict
         "class RecalPolyQC  : RecalPolyQ, RecalPolyC {
  // How to cherry-pick functions?
};"))))

(slide
 #:name "Implementation Inheritance"
 (shadow-frame (big (t "Implementation Inheritance: Pro & Contra")))
 (pitem "'Natural evolution' from mono- to polymorphic")
 (pitem "Straightforward to implement")
 (pitem "Works well in small, easy cases")
 (blank 20)
 (mitem "Multiplicative complexity (NxM implementations)")
 (mitem "Long inheritance chains")
 (mitem "Diamond inheritance problem")
 (mitem "Magohamoth-sized classes")
 (mitem "'But I only want feature a, not a, b, c & d!'")
 )

(slide
 #:name "Interface Inheritance"
 (shadow-frame (big (t "Interface Inheritance")))
 (frame (with-scale 0.85 (codeblock-pict
         "struct QualityFn {virtual double apply(Quality q) = 0;};
struct ContextFn {virtual double apply(Context c) = 0;};")))
(blank 20)
 (frame (with-scale 0.85 (codeblock-pict
"class Recal final {
  QualityFn* qf;
  ContextFn* cf;
public:
  Recal(QualityFn* q, ContextFn* c) {qf = q; cf = c;}
  double probability(Data d)
    {return logistic(qf->apply(d.Q) + cf->apply(d.C));}
};")))
 (blank 20)
 (hc-append 50
            (frame (with-scale 0.85 (codeblock-pict
                    "class EmpiricQuality final: QualityFn {
  double apply(Quality q) override
    {return empiric(q);}
};

class PolyQuality final : QualityFn {
  double apply(Quality q) override
    {return polynomial(q);}
};")))
            (frame (with-scale 0.85 (codeblock-pict
                    "class EmpiricContext final : ContextFn {
  double apply(Context c) override
    {return empiric(c);}
};

class PolyContext final : ContextFn {
  double apply(Context c) override
    {return polynomial(c);}
};")))))

(slide
 #:name "Simulation"
 (shadow-frame (big (t "Simulation")))

 (para (small (tt "~/Git/atlas/build/atlas --task simulate --ploidy 2,2,1 --depth 2 --chrLength 500000"))
 (small (tt "  --pmd \"doubleStrand:Exponential[50,0.5,0.1,0.01]:Exponential[50,0.5,0.1,0.01]\""))
 (small (tt "  --recal \"intercept[0.1];quality:polynomial[0.8,-0.05]\"")))
 (blank 20)
 (hc-append 20 (scale-to-fit (bitmap "imgs/PMD.png") (* client-w 0.4) (/ client-h 1))
            (scale-to-fit (bitmap "imgs/recal.png") (* client-w 0.4) (/ client-h 1))))


(slide
 #:name "Estimate PMD ATLAS"
 (shadow-frame (big (t "Estimate PMD pattern")))

 (para (small (tt "~/Git/atlas/build/atlas --task PMD --bam *.bam --fasta *.fasta"))
 (small (tt "  --pmdModels \"doubleStrand:Exponential:Exponential\"")))
 (blank 10)
 (bt "also possible")
 (blank 10)
 (para (small (tt "  --pmdModels \"singleStrand:Empiric:Empiric\"")))
 )

(slide
 #:name "Estimate recal ATLAS"
 (shadow-frame (big (t "Estimate recalibration Pattern")))

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
 (shadow-frame (big (t "Estimate 𝜃")))

 (para (small (tt "~/Git/atlas/build/atlas --task theta --bam *.bam")))
 (blank 50)
 (para (small (tt "~/Git/atlas/build/atlas --task theta --bam *.bam --pmd *_PMD.txt")))
 (blank 50)
 (para (small (tt "~/Git/atlas/build/atlas --task theta --bam *.bam"))
 (small (tt "  --pmd *_PMD.txt --recal *_recal.txt"))))



(slide
 #:name "Calculating Genotype Likelihoods"
 (shadow-frame (big (t "Calculating Genotype Likelihoods")))
 (para (emph "1. Estimate PMD pattern"))
 (item #:bullet (bt "Covariate:") "Position")
 (aitem "PMD(C→T) = Number(C→T)/Number(C)")
 (blank 10)
 (para (emph "2. Estimate Sequencing Error recalibration"))
 (item #:bullet (bt "Covariates:") "Sequencing quality, Mapping quality, Context, Position, Fragment length")
 (aitem "Use monomorphic/haploid sites")
 (aitem "EM on multi-variate recalibration function")
 (blank 10)
 (para (emph "3. Estimate Genotype Likelihoods"))
 (aitem "𝜃, inbreeding coefficient, ...")
 )
