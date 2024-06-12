"TecProg - Programación Funcional"
"Guía 4"
"==========================Ejercicio 1============================="
;Definición de la estructua del punto en el plano
(define-struct punto2d (x y))

;Función principal
(define distancia2d
  (lambda (p1 p2)
    (let ((cuadrado (lambda (x) (* x x)))
          (dx (- (punto2d-x p2) (punto2d-x p1)))
          (dy (- (punto2d-y p2) (punto2d-y p1))))
      (sqrt (+ (cuadrado dx) (cuadrado dy))) 
      )
    )
  )

;Creación de puntos para las pruebas
(define pto1 (make-punto2d 1 1))
(define pto2 (make-punto2d 2 4))

(distancia2d pto1 pto2)


"=================================================================="
"==========================Ejercicio 2============================="
;Definición de la estructura del punto en el espacio
(define-struct punto3d (x y z))

;Función auxiliar que realiza la sumatoria coordenada a coordenada y retorna un nuevo punto.
(define sumatoria
  (lambda (lsP)
    (if (null? lsP)
        (make-punto3d 0 0 0)
        (make-punto3d (+ (punto3d-x (car lsP)) (punto3d-x (sumatoria (cdr lsP))))
                      (+ (punto3d-y (car lsP)) (punto3d-y (sumatoria (cdr lsP))))
                      (+ (punto3d-z (car lsP)) (punto3d-z (sumatoria (cdr lsP)))))
        )
    )
  )



;Función auxiliar que determina el tamaño de la lista
(define size
  (lambda (ls)
    (if (null? ls)
        0
        (+ 1 (size (cdr ls)))
        )
    )
  )

;Función principal
(define centro-gravedad
  (lambda (lsP)
    (if (null? lsP)
        '()
        (let ((p (sumatoria lsP)) (T (size lsP)))
          (make-punto3d (/ (punto3d-x p) T)
                        (/ (punto3d-y p) T)
                        (/ (punto3d-z p) T)
                      )
          )
        )

    )
  )

;Creación de puntos de prueba
(define P1 (make-punto3d 1 1 -1))
(define P2 (make-punto3d 1 -1 1))
(define P3 (make-punto3d 1 0 2))
(define P4 (make-punto3d 1 2 0))
(define P5 (make-punto3d 1 -2 0))

;Prueba: Llamo a la Función Principal y veo las coordenadas resultantes del centro de gravedad.
(display "\n Coordenada en X: ")
(punto3d-x (centro-gravedad (list P1 P2 P3 P4 P5)))
(display "\n Coordenada en Y: ")
(punto3d-y (centro-gravedad (list P1 P2 P3 P4 P5)))
(display "\n Coordenada en Z: ")
(punto3d-z (centro-gravedad (list P1 P2 P3 P4 P5)))

"=================================================================="
"==========================Ejercicio 3============================="
;Función auxiliar: concatena 2 la lista 1 seguida de la lista 2
(define concatenar
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (concatenar (cdr l1) l2)))
    )
  )
;(concatenar '(1 2 3) '(4 5 6)) ;Prueba de la función auxiliar

;Función auxiliar: Retorna la lista de todas las distancias posibles entre los puntos
(define distancias
  (lambda (lsP)
     (if(or (null? lsP) (null? (cdr lsP)))
       '()
       (concatenar
        (map (lambda (P)
               (distancia2d (car lsP) P))
              (cdr lsP))
        (distancias (cdr lsP))
        )
       )
    )
  )

;Creación de puntos para las pruebas
(define P1 (make-punto2d 0 0))
(define P2 (make-punto2d 1 0))
(define P3 (make-punto2d 1 1))
(define P4 (make-punto2d 2 1))
(define P5 (make-punto2d 2 2))

;(distancias (list P1 P2 P3 P4 P5)) ;Prueba de la función auxiliar. 

;Función auxiliar para calcular el mayor de una lista de números
(define mayor
  (lambda (ls)
    (if (null? ls)
        '()
        (if (null? (cdr ls))
            (car ls)
            (if (> (car ls) (mayor (cdr ls)))
                (car ls)
                (mayor (cdr ls))
                )
            )
        )
    )
)
;(mayor '(1 4 5 2 6 83 1 2 4))

;Función Principal
(define distMAX
  (lambda (lsP)
    (if (null? lsP)
        '()
        (mayor (distancias lsP))
        )
    )
  )
(distMAX (list P1 P2 P3 P4 P5))
"=================================================================="

"==========================Ejercicio 6============================="

;Función auxiliar que suma enteros de una lista de enteros
(define suma
  (lambda (ls)
    (if (null? ls)
        0
        (+ (car ls) (suma (cdr ls)))
        )
    )
  )
;Función auxiliar que calcula el peso en ASCII de una palabra
(define pesopalabra
  (lambda (palabra)
    (if (null? palabra)
        ""
        (suma (map char->integer (string->list palabra)))
        )
    )
  )
;(pesopalabra "casa")

;Función auxiliar que elimina el elemento "el" de la lista ls la primera vez que lo encuentra
(define eliminar
  (lambda (el ls)
    (if (null? ls)
        '()
        (if (equal? el (car ls))
            (cdr ls)
            (cons (car ls) (eliminar el (cdr ls)))
            )
        )
    )
  )

;Función auxiliar que retorna la palabra con menor peso
(define menor
  (lambda (ls)
    (if (null? ls)
        '()
        (if (null? (cdr ls))
            (car ls)
            (if (< (pesopalabra(car ls)) (pesopalabra (menor (cdr ls))))
                (car ls)
                (menor (cdr ls))
                )
            )
        )
    )
  )
;(menor '("casa" "Auto" "Moto" "juego"))

;Función principal
(define ordenar
  (lambda (ls)
    (if (null? ls)
        '()
         (cons (menor ls) (ordenar (eliminar (menor ls) ls)))
         )
    )
  )

(ordenar '("moto" "auto" "casa" "juego" "aire"))
"=================================================================="
"==========================Ejercicio 7============================="

;Función auxiliar que concatena 2 listas
(define concatenar
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (concatenar (cdr l1) l2))
        )
    )
  )

;Función auxiliar que invierte una lista
(define inversa
  (lambda (ls)
    (if (null? ls)
        '()
        (concatenar (inversa (cdr ls)) (list (car ls)))
        )
    )
  )
;(inversa '(1 2 3 4 5 6))

;Función Principal
(define fullreverse-list
  (lambda (ll)
    (if (list? ll)
        (if (null? ll)
            '()
            (map fullreverse-list (inversa ll))
            )
        ll
     )
    )
  )
(fullreverse-list '(1 (2 3 4 (4 5) (3 (5 6)) 4)))
"=================================================================="
"==========================Ejercicio 8============================="
;Función auxiliar que concatena 2 listas
(define concatenar
  (lambda (l1 l2)
    (if (null? l1)
        l2
        (cons (car l1) (concatenar (cdr l1) l2))
        )
    )
  )
;Función principal
(define app2list
  (lambda (e1 e2)
    (cond
      ((and (list? e1) (list? e2))
       (concatenar e1 e2))
      ((and (list? e1) (not (list? e2)))
       (concatenar e1 (list e2)))
      ((and (not (list? e1)) (list? e2))
       (cons e1 e2))
      (else
       (cons e1 (list e2)))  
      )
    )
  )
(app2list 'a 'b)
(app2list '(a) '(b))
(app2list '(a) 'b)
(app2list 'a '(b))

"=================================================================="
