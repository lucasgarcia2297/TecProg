"TecProg - Programación Funcional"
"Guía 3"
"==========================Ejercicio 1============================="
(define factorial
  (lambda (x)
      (if (= x 0)
          1
          (* x (factorial(- x 1)))
          )
    )
  )


(factorial 7)
"=================================================================="
"==========================Ejercicio 2.1============================="
(define largo
  (lambda (ls)
    (if (null? ls)
        0
        (+ 1 (largo (cdr ls)))
        )
    )
  )
(largo '(a fg v 3 5))
"=================================================================="
"==========================Ejercicio 3.1============================="
(define count-elem
  (lambda (e ls)
    (if (null? ls)
        0
        (if (equal? (car ls) e)
            (+ 1 (count-elem e (cdr ls)))
            (count-elem e (cdr ls))
            )
        )
    )
 )

(count-elem 3 '(1 2 3 4 5 4 3 2 1))
"=================================================================="
"==========================Ejercicio 2.2============================="
;Reemplazar
(define subst    
  (lambda (v1 v2 ls)
    (if (null? ls)
        '()
        (if (equal? v1 (car ls))
            (cons v2 (subst v1 v2 (cdr ls)))
            (cons (car ls) (subst v1 v2 (cdr ls)))
            )
        )
    )
  )
(subst 'c 'k '(c o c o n u t))
"=================================================================="
"==========================Ejercicio 3.2============================="
;Función auxiliar para la función Agrupar
(define eliminar
  (lambda (e ls)
    (if (null? ls)
        '()
        (if (equal? (car ls) e)
            (eliminar e (cdr ls))
            (cons (car ls) (eliminar e (cdr ls)))
            )
        )
    )
  )
;(eliminar 'a '( a b c a c b a c a))

;Función Principal
(define agrupar
  (lambda (ls)
    (if (null? ls)
        '()
        (cons (vector->list (make-vector
                             (count-elem (car ls) ls)
                             (car ls)
                             ))
              (agrupar (eliminar (car ls) ls))
              )
        )
    )
  )

(agrupar '(A A B C A B A D C))
(agrupar '(A))
(agrupar '())
"=================================================================="
"==========================Ejercicio 5============================="
(define concatenar
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (concatenar (cdr l1) l2))
        )
    )
  )
(concatenar '(1 2 3 4) '(5 6 7 8 9))
"=================================================================="
"==========================Ejercicio 6============================="
(define primer-num
  (lambda (ls)
    (if (null? ls)
        '()
        (if (number? (car ls))
            (car ls)
            (primer-num (cdr ls))
            )
        )
    )
  )
(primer-num '((1 . 2) 'a (b) (5) 6 8 'a 9))
"=================================================================="
"==========================Ejercicio 7============================="
(define attach-at-end
  (lambda (v ls)
    (if (null? ls)
        (list v)
        (cons (car ls) (attach-at-end v (cdr ls)))
        )
    )
  )
(attach-at-end 'prueba '(esto es una))
"=================================================================="
"==========================Ejercicio 8============================="
;Función auxiliar que convierte todos los numeros en una lista en valores positivos.
(define absolutos
  (lambda (ls)
    (if (null? ls)
        '()
        (if (< (car ls) 0)
           (cons (* (car ls) -1) (absolutos (cdr ls)))
           (cons (car ls) (absolutos (cdr ls)))
           )
        )
    )
  )

;Función auxiliar que convierte los elementos de tipo string de una lista a valores numéricos.
(define string-to-number
  (lambda (ls)
    (if (null? ls)
        '()
        (if (string? (car ls))
            (cons (string->number (car ls)) (string-to-number (cdr ls)))
            (cons (car ls) (string-to-number (cdr ls)))
            )
        )
    )
  )
;Función auxiliar que convierte los elementos de tipo string que sean una "V" (Verdadero) o una
;"F" (falso) en 1 y 0 respectivamente. Si hay otros valores de string los "elimina".
(define VF-to-number
  (lambda (ls)
    (if (null? ls)
        '()
        (cond
          ((equal? (car ls) "V")
           (cons '1 (VF-to-number (cdr ls))))
          ((equal? (car ls) "F")
           (cons '0 (VF-to-number (cdr ls))))
          (else (VF-to-number (cdr ls)))
          )
        )
    )
  )
;Función principal
(define convdatos
  (lambda (ll)
    (if (null? ll)
        '()
        (cond
          ((equal? (car (car ll)) "D")
            (cons (absolutos (car (cdr (car ll))))
                  (convdatos (cdr ll))))
           ((equal? (car (car ll)) "T")
            (cons (absolutos (string-to-number (car (cdr (car ll)))))
                  (convdatos (cdr ll))))
           ((equal? (car (car ll)) "B")
            (cons (VF-to-number (car (cdr (car ll))))
                  (convdatos (cdr ll))))
           (else (convdatos (cdr ll)))
           )
        )
    )
  )
              
(convdatos '(("D" (1 2 -3 4 -5))
             ("T" ("6" "-7" "8"))
             ("B" ("V" "F")))
           )
             
"=================================================================="
"==========================Ejercicio 9============================="
;Función auxiliar que calcula la distancia entre 2 puntos representados mediante listas impropias.
(define distancia2d
  (lambda (p1 p2)
    (let ((x (- (car p1) (car p2)))
          (y (- (cdr p1) (cdr p2))))
      (sqrt (+ (* x x) (* y y)))
      )
    )
  )

;Función Principal
(define distancias
  (lambda (puntos)
    (if (null? (car puntos))
        '()
        (if (null? (cdr puntos))
            '()
            (cons (distancia2d (car puntos) (cadr puntos)) (distancias (cdr puntos)))
            )
        )
    )
  )
(distancias '((1 . 1) (1 . 2) (2 . 2) (2 . 1) (1 . 1)))