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
 #:name "Why Low-Depth"
 (shadow-frame (big (t "Why Low-Depth")))
(vr-append 20
 (hb-append 20
   (scale-to-fit (bitmap "imgs/finches.png") (* client-w .9) (* client-h .3))
   (scale-to-fit (bitmap "imgs/tsetse.png") (* client-w .9) (* client-h .3)))
(hb-append 20
   (scale-to-fit (bitmap "imgs/cheddar_man.png") (* client-w .9) (* client-h .3))
   (scale-to-fit (bitmap "imgs/hippo.png") (* client-w .9) (* client-h .3)))))

(slide
 #:name "High-Depth DNA"
 (shadow-frame (big (t "High-Depth DNA")))
 (small (para #:width 0.7 #:align 'center
         (hc-append (tt "01 TCTAGCGCT") (red "T") (tt "GGAGTCTT...GCTGGC         "))
         (hc-append (tt "02  CTAGCGCT") (red "G") (tt "GGAGTCTT...GCTGGCG        "))
         (hc-append (tt "03   TCGCGCT") (red "A") (tt "GGAGTCAT...GCTGGCGA       "))
         (hc-append (tt "04    ATCGCT") (red "A") (tt "GGAGTCTT...GCTGGCGAC      "))
         (hc-append (tt "05     GCGCT") (red "A") (tt "GGAGTCTT...GCTGGCGACA     "))
         (hc-append (tt "06      CGCT") (red "G") (tt "GGCGTCTT...GCTGGCGACAG    "))
         (hc-append (tt "07       GCT") (red "G") (tt "GGAGTCTT...GCTGGCGACAGG   "))
         (hc-append (tt "08        CT") (red "A") (tt "GGAGTCTT...GAGAGAGAGAGAG  "))
         (hc-append (tt "09         T") (red "A") (tt "GGAGTCTT...GCTGGCGACAGGCA "))
         (hc-append (tt "10          ") (red "G") (tt "GGAGTCTT...GCTGGCGACAGGCAG"))
         (tt "             .")
         (tt "             .")
         (tt "             ."))))

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
 #:name "Low-Depth DNA"
 (shadow-frame (big (t "Low-Depth DNA")))
 (small (para #:width 0.9 #:align 'center
         (hc-append (tt "01 ...TCTAGCGCT") (red "T") (tt "GGAGTC                       "))
         (hc-append (tt "02              ") (tt "GGAGTCTT...GCT               "))
         (hc-append (tt "03              ") (tt "       T...GCTGGCG           "))
         (hc-append (tt "04              ") (tt "                CGACAGGC     "))
         (hc-append (tt "05              ") (tt "                    AGGCAG...")))))

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
 (para (t "Deamination of Cytosine to Uracil: C→U")
 (t "Uracil will be read as Thymine: C→U→T"))
 (blank 20)
 (para (emph "Estimation of  C→T transition")
 (t "For every C in reference, count occurrence in data")
 (aitem "Number of C→T per position")
 (aitem "Total number of Cs per position"))
 (item #:bullet (bt "Position:") (t " Distance from read-end"))
 (blank 20)
 (para (tt "PMD(C→T, p) = Number(C→T, p)/tot(C, p)"))
 (blank 20)
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
       (tt "              + f2(position) + f3(mappingQuality)")
       (tt "              + f4(fragmentLength)+ f5(previousBase)]")
       (tt "                               ")
       (tt "f : polynomial, empiric, probit or 0")
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
        (tt "L(C) = 0.7×0.2×0.05")
        (tt "       + 0.3×0.95")
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
 (aitem "call, inbreeding, GLF, majorMinor, ...")
 (blank 20)
 (eaitem "Simulate data")
 (eaitem "Estimate PMD")
 (eaitem "Estimate sequencing error recalibration")
 (eaitem "Estimate heterozygosity (𝜃)"))

(slide
 #:name "C++ Code-Base"
 (shadow-frame (big (t "Our C++ Code-Base")))
 (ht-append 50
(frame (inset (table 1
                       (small (list
                        (emph "Coretools")
                         (t "Input/Output")
                         (t "Error Management")
                         (t "Task Management")
                         (t "Math Functions")
                         (t "String Functions")
                         (t "Random Generator")
                         (t "Types")
                         (t "Containers")
                         (t "...")))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
(frame (inset (table 1
                       (small (list
                        (emph "Genometools")
                         (t "Genotypes")
                         (t "GenomePositions")
                         (t "Fasta-File I/O")
                         (t "VCF-File I/O")
                         (t "...")))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
(frame (inset (table 1
                       (small (list
                        (emph "Stattools")
                         (t "Directed acyclic graphs")
                         (t "Expectation-maximization")
                         (t "Hidden Markov Model")
                         (t "Markov Chain Monte Carlo")
                         (t "Maximum Likelihood Estimation")
                         (t "...")))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))))

(slide
 #:name "C++ Code-Base 2"
 (shadow-frame (big (t "Our C++ Code-Base")))
 (hc-append 200
(frame (inset (table 2
                       (list
                        (t "") (emph "Coretools")
                        (t "") (emph "Genometools")
                        (t "") (emph "Stattools")
                        (blank-line) (blank-line)
                        (colorize (t "✔") "darkgreen") (t "Common interface")
                        (colorize (t "✔") "darkgreen") (t "Consistent naming")
                        (colorize (t "✔") "darkgreen") (t "Consistent formatting")
                        (colorize (t "✔") "darkgreen") (t "Version control")
                        (colorize (t "✔") "darkgreen") (t "Thoroughly tested")
                        (colorize (t "✔") "darkgreen") (t "Optimized performance")
                        (t "") (t "..."))
                       lc-superimpose
                       cc-superimpose
                       gap-size
                       8) gap-size))
(vl-append (hc-append (pip-arrow-line -150 0 20) (tt "  ") (bt "Atlas"))
           (blank-line)
           (hc-append (pip-arrow-line -150 0 20) (tt "  ") (bt "Bangolin"))
           (blank-line)
           (hc-append (pip-arrow-line -150 0 20) (tt "  ") (bt "ApproxWF"))
           (blank-line)
           (hc-append (pip-arrow-line -150 0 20) (tt "  ") (bt "SexEstimation"))
           (blank-line)
           (hc-append (pip-arrow-line -150 0 20) (tt "  ") (bt "TreeSwirl"))
           (blank-line)
           (hc-append (pip-arrow-line -150 0 20) (tt "  ") (bt "Birp"))
           (blank-line)
           (hc-append (pip-arrow-line -150 0 20) (tt "  ") (bt "...")))))

(slide
 #:name "Weak Types"
 (shadow-frame (big (t "Weak Types")))
 (frame (with-scale 0.85 (codeblock-pict
"// Unscoped enumerations:
enum Base {A, C, G, T};
enum Genotype {AA, AC, AG, AT, CC, CG, CT, GG, GT, TT};

double baseLikelihoods[4];
double genotypeLikelihoods[10];

baseLikelihoods[A]  = 0.5;
baseLikelihoods[C]  = 3.1; // Not a probability!
baseLikelihoods[A] *= 5;   // -> 2.5
baseLikelihoods[1]  = 0.7; // 0-indexed!

genotypeLikelihoods[GG] = 0.9;
genotypeLikelihoods[G]  = 0.9; // index = AG!"))))

(slide
 #:name "Strong Types"
 (shadow-frame (big (t "Strong Types")))

 (para (frame (with-scale 0.85 (codeblock-pict
"using coretools::TProbability; // Only defined in interval: [0, 1] 
using coretools::TStrongArray; // Only allows scoped index-types"))))
 (blank 10)
 (para (frame (with-scale 0.85 (codeblock-pict
"// Scoped enumerations:
enum class Base {A, C, G, T, size};
enum class Genotype {AA, AC, AG, AT, CC, CG, CT, GG, GT, TT, size};

TStrongArray<TProbability, Base> baseLikelihoods;
TStrongArray<TProbability, Genotype> genotypeLikelihoods;

baseLikelihoods[Base::A]  = 0.5;
baseLikelihoods[Base::C]  = 3.1; // Exception in debug-mode
baseLikelihoods[Base::A] *= 5;   // Will not compile!
baseLikelihoods[1]        = 0.7; // Will not compile!

genotypeLikelihoods[Genotype::GG] = 0.9;
genotypeLikelihoods[Base::G]      = 0.9; // Will not compile!"))))
 (blank 10)
 (para 
  (frame (with-scale 0.85 (codeblock-pict
"// Range-based Loops                                              
double ll = 0; 
for (auto p: genotypeLikelihoods)
   ll += std::log(p);")))))

(slide
 #:name "Recal Implementation"
 (shadow-frame (big (t "Recal Implementation")))
 (para (tt "𝜀 = logistic[f0 + f1(qualityScore) + f2(position) + f3(mappingQuality)")
       (tt "              + f4(fragmentLength)+ f5(previousBase)]")
       (tt "                                                     ")
       (tt "f : polynomial, empiric, probit or 0"))
 (blank-line)
(frame (with-scale 0.85 (codeblock-pict
         "class Recal {
  double f_0;
  double f_quality(Quality q)          {return some_f(q);}
  couble f_position(Position p)        {return some_f(p);}
  double f_mappingQuality(MQuality mq) {return some_f(mq);}
  double f_fragmentLength(FLength fl)  {return some_f(fl);}
  couble f_previousBase(PrevBase pb)   {return some_f(pb);}

public:
  double probability(Data d) {
    return logistic(f_0 + f_quality(d.Q)
                    + f_position(d.p) + f_mappingQuality(d.mq)
                    + f_fragmentLegnth(d.fl) + f_previousBase(d.pb));
  }
};"))))

(slide
 #:name "Implementation Inheritance"
 (shadow-frame (big (t "Implementation Inheritance")))
 (frame (with-scale 0.85 (codeblock-pict
         "class Recal {
  virtual double f_quality(Quality q) {return empiric(q);}
  virtual couble f_position(Position p) {return empiric(p);}
public:
  double probability(Data d)
    {return logistic(f_quality(d.Q) + f_context(d.p));}
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
                    "class RecalPolyP  : Recal {
  double f_context(Position p) override
    {return polynomial(p);}
};"))))
(hc-append 80 (pip-arrow-line 40 40 20) (pip-arrow-line -40 40 20))
 (blank 20)
 (frame (with-scale 0.85 (codeblock-pict
         "class RecalPolyQP  : RecalPolyQ, RecalPolyP {
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
  PositionFn* pf;
public:
  Recal(QualityFn* q, PositionFn* p) {qf = q; pf = p;}
  double probability(Data d)
    {return logistic(qf->apply(d.Q) + pf->apply(d.p));}
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
                    "class EmpiricPosition final : PositionFn {
  double apply(Position p) override
    {return empiric(p);}
};

class PolyPosition final : PositionFn {
  double apply(Position p) override
    {return polynomial(p);}
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
