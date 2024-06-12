"[TecProg 2023]"
"Guía N°1 - Programación Funcional"
"Garcia Lucas Enedín."

"===================Ejercicio 1====================="
( + (+ (* 2 -1/3) -10.7) 7)  ;Otra forma: (+ 7 (* 2 -1/3) -10.7)
(/ (* 7/3 5/9) (- 5/8 2/3))
(+ 1 (/ 3 (+ 2 (/ 1 (+ 5 1/2)))))
(* (* (* (* (* (* 1 -2) 3) -4) 5) 6) 7) ;Otra forma: (* 1 -2 3 -4 5 6 7)

"==================================================="
"===================Ejercicio 2====================="
(cons 'car '+);--------------------------->(car . +) [Agrega el simbolo 'car con el simbolo '+ en una lista impropia.]
(list 'esto '(es muy fácil));------------->(esto (es muy facil)) [Crea una lista con el simbolo 'esto y la sublista '(es muy facil)]
(cons 'pero '(se está complicando...));--->(pero se está complicando...) [Agrega el simbolo 'pero en la sublista '(se está complicando...)]
(cons '(y ahora no se que ) 'hizo);------->((y ahora no se que) . hizo) [Agrega toda la sublista '(y ahora no se que ) seguido del simbolo 'hizo en una lista impropia.]
(quote (+ 7 2));-------------------------->(+ 7 2) [con quote se crea una lista considerando que todo lo que haya dentro son simbolos, incluyendo los procedimientos]
(cons '+ '(10 3));------------------------>(+ 10 3) [Agrega el simbolo '+ a la sublista '(10 3)]
(car '(+ 10 3));--------------------------> + [el car toma el primer elemento de la lista, en este caso es el símbolo +]
(cdr '(+ 10 3));-------------------------->(10 3) [el cdr devuelve la cola de la lista, es decir la lista sin el primer elemento]
cons;------------------------------------->#<procedure:cons> 
(quote (cons (car (cdr (7 4)))));--------->(cons (car (cdr (7 4)))) [Al definir la lista como quote, todo lo que este dentro de esta se toma como símbolos, por lo que los procedimientos, cons, car, cdr solo son simbolos]
(quote cons);-----------------------------> cons [porque lo toma como un simbolo 'cons y no como variable. Equivale a: 'cons]
(car (quote (quote cons)));---------------> quote [quote (quote cons) crea una lista con los simbolos 'quote y 'cons al aplicarle el car retorna quote]
(+ 2 3);----------------------------------> 5 [realiza la suma entre los valores 2 y 3]
(+ '2 '3);--------------------------------> 5 [si son numeros es indiferente ponerle ' ya que Racket intepreta automaticamente que se tratan de numeros al intentar realizar una operación aritmetica.]
(+ (car '(2 3)) (car (cdr '(2 3))));------> 5 [  (+ 2 3)=> 5   Toma el car de la primer lista, el segundo de la segunda lista y los suma]
((car (list + - * /)) 2 3);---------------> 5 [el car toma el primer operador de la lista que es la suma +, luego se realiza la operación con 2 y 3]
"==================================================="
"===================Ejercicio 3====================="
'((a b)(c d))
(car (car '((a b)(c d))))
(car (cdr (car '((a b)(c d)))))
(car (car (cdr '((a b)(c d)))))
(car (cdr (car (cdr '((a b)(c d))))))
"==================================================="
"===================Ejercicio 4====================="
"Combinaciones legales de car y cdr aplicables a ((a b)(c d))"
'((a b)(c d))
(car (car'((a b)(c d))));---------------->a.  [Forma simplificada: (caar '((a b)(c d)))]
(car (cdr (car '((a b)(c d)))));--------->b.  [Forma simplificada: (cadar '((a b)(c d))]
(car (car (cdr '((a b)(c d)))));--------->c.  [Forma simplificada: (caadr '((a b)(c d))]
(car (cdr (car (cdr '((a b)(c d))))));--->d . [Forma simplificada: (cadadr '((a b)(c d)))]
(cdr (cdr '((a b)(c d))));--------------->()
(cdr (car '((a b)(c d))));--------------->(b)
(car '((a b)(c d)));--------------------->(a b)
(cdr (car (cdr '((a b)(c d)))));--------->(d)
(car (cdr '((a b)(c d))));--------------->(c d)
(cdr '((a b)(c d)));--------------------->((c d))



"==================================================="
"===================Ejercicio 5====================="
"Describir los pasos que realiza la sentencia: ((car (cdr (cdr (list + - * /)))) 5 5)."
((car (cdr (cdr (list + - * /)))) 5 5)
"1er Paso: Crea la lista de operadores."
"2do Paso: De la lista de operadores, toma todos menos el primero y los retorna en una lista. La lista se reduce a ( - * /)"
"3er Paso: Vuelve a tomar todos menos el primero. La lista se reduce a: (* /)"
"4to Paso: Se toma el primero de la lista anterior: Operador *"
"5to Paso: se realiza la multiplicación 5*5."
"Resultado de la Sentencia: 25."


"==================================================="
"===================Ejercicio 6====================="
"Obtener la x de las siguientes listas:"

"'(a b c . x)"
"'(a b c x)"
"'((a . x) b)"
"'(x . a)"
"'(a . x)"

;Solución:
(cdr (cdr (cdr '(a b c . x))))
(car (cdr (cdr (cdr '(a b c x)))))
(cdr (car '((a . x) b)))
(car '(x . a))
(cdr '(a . x))