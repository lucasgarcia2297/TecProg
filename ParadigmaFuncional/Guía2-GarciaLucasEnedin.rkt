"[TecProg 2023]"
"Guía N°1 - Programación Funcional"
"Garcia Lucas Enedín."

"===================Ejercicio 1====================="
;a. (+ (/ (* 7 a) b) (/ (* 3 a) b) (/ (* 7 a) b))
;si a=8 b=4
(let ((a 8)(b 4))
  (let ((x (/ (* 7 a) b))
        (y (/ (* 3 a) b)))
    ( + x y x))
  )
;b. (cons (car (list a b c)) (cdr (list a b c)))
(let ((list1 '(a b c)))
  (cons (car list1) (cdr list1))
  )

"==================================================="
"===================Ejercicio 2====================="
(let ((x 9))            ;Define la variable local x y le asigna 9
  (* x                  ;Multiplica la variable local x (9) por lo que retorna la nueva sentencia let
     (let ((x (/ x 3))) ;Se define una nueva variable local x y se le asigna el valor de la x anterior (9) dividido 3, es decir 3.
       (+ x x))))       ;suma dos veces el valor de la nueva variable x (3+3)
                        ;El resultado final es 9*6 = 54
"==================================================="

"===================Ejercicio 3====================="
;a)
(let ((x 'a) (y 'b))
  (list (let ((x 'c)) (cons x y))     
        (let ((y 'd)) (cons x y))))
;Resultado: ((c . b)(a . d))
;Solución:
(let ((x 'a) (y 'b))
  (list (let ((w 'c)) (cons w y))     ;redefino solo x
        (let ((z 'd)) (cons x z))))   ;redefino solo y
;La salida es la lista de listas impropias de los valores ((w . y)(x . z)) es decir ((c . b)(a . d))

;---------------------------------------------------
;b)
(let ((x '((a b) c)))
  (cons (let ((x (cdr x)))
          (car x))
        (let ((x (car x)))
          (cons (let ((x (cdr x)))
                  (car x))
                (cons (let ((x (car x)))
                        x)
                      (cdr x))))))
(let ((x '((a b) c)))                     ;x = '((a b) c)
  (cons (let ((y (cdr x)))                ;y = '(c)
          (car y))                        ;'c
        (let ((z (car x)))                ;z = '(a b)
          (cons (let ((w (cdr z)))        ;w = '(b)
                  (car w))                ;'b
                (cons (let ((v (car z)))  ;v = 'a
                        v)                ;'a
                      (cdr z))))))        ;()
;Resultado: (c b a b)
"==================================================="

"===================Ejercicio 4====================="
(let ((f (lambda (x) x))) (f 'a))
;Define una variable local f, le asigna una operación lambda en la cual solo retorna el valor que le des, por lo que f 'a solo retorna 'a' 
(let ((f (lambda x x))) (f 'a))
;Retorna (a) ya que la función lambda solo retorna el mismo argumento que se le pasa, metido en una lista.
(let ((f (lambda (x . y) x))) (f 'a))
;Se le pasa un par (x . y) y retorna el valor a, ya que es el primer valor (x) en la función lambda, mientras que a y sería una lista vacía.
(let ((f (lambda (x . y) y))) (f 'a))
;Retorna una lista vacía () debido a que sólo se le pasa el valor 'a el cual es asignado en x, mientras que en y se asigna la lista vacía.

"==================================================="

"===================Ejercicio 5====================="
(define sumar
  (lambda (x y)
    (+ x y)))

(sumar 2 5)


(define restar
  (lambda (x y)
    (- x y)))

(restar 2 5)

;Podria tambien hacerse con let y sumar/restar de forma local.
"==================================================="

"===================Ejercicio 6====================="
(define shorter
  (lambda (list1 list2)
    (if (<= (length list1) (length list2))
        list1
        list2
        )
    )
  )
(shorter '(a b) '(c d e))
(shorter '(a b) '(c d))
(shorter '(a b) '(c))
"==================================================="

"===================Ejercicio 7====================="
(define area
  (lambda (r)
    (* pi (* r r))
    )
  )
(area 3)
"==================================================="

"===================Ejercicio 8====================="
(define perimetro
  (lambda (r)
    (* 2 pi r)
    )
  )
(perimetro 1)

"==================================================="

"===================Ejercicio 9====================="
(define circlestuff
  (lambda (r)
    (list (area r) (perimetro r)))  ;Reutilizo las funciones ya definidas de ejercios anteriores
  )
(circlestuff 3)
"==================================================="

"===================Ejercicio 10===================="
(define distance2d
  (lambda (p1 p2)
    (let ( 
          (cuadrado (lambda (n) (* n n)))
          (x (- (car p1 ) (car p2)))
          (y (- (cdr p1 ) (cdr p2)))
          )
        (sqrt (+ (cuadrado x) (cuadrado y)))
      )
    )
  )
 
(distance2d '(1 . 1)'(2 . 2))
"==================================================="

"===================Ejercicio 11===================="
(define proximo
  (lambda (P listP)
    (if (null? listP)
        '()
        (if (null? (cdr listP))    
            (distance2d P (car listP))
            (if (<= (distance2d P (car listP)) (proximo P (cdr listP)))
                (distance2d P (car listP))
                (proximo P (cdr listP))
                )
            )
        )
    )
  )
(proximo '(0 . 0) '((1 . 3)(2 . 2)(7 . 6)(4 . 5)(2 . 0.5)(2 . 5)))
(proximo '(1 . 0) '())

"==================================================="