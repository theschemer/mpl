
(library (mpl rational-expand)

  (export rational-expand)

  (import (except (rnrs) + - * / numerator denominator exp sin cos)
          (mpl automatic-simplification)
          (mpl algebraic-expand)
          (mpl numerator)
          (mpl denominator)
          (mpl rational-gre)
          (mpl rationalize-expression)
          )

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; (define (rational-expand u)

  ;;   (let ((f (algebraic-expand (numerator   u)))
  ;;         (g (algebraic-expand (denominator u))))

  ;;     (if (equal? g 0)
          
  ;;         #f 

  ;;         (let ((h (/ f g)))

  ;;           (if (rational-gre? h)

  ;;               h

  ;;               (rational-expand
  ;;                (rationalize-expression h)))))))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (define (rational-expand u)

    (let ((f (algebraic-expand (numerator   u)))
          (g (algebraic-expand (denominator u))))

      (if (equal? g 0)
          
          #f

          (let ((h (rationalize-expression (/ f g))))

            (if (equal? h u)
                u
                (rational-expand h))))))

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  )