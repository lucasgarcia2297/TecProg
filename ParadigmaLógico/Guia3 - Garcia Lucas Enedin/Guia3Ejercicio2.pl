p(1).
p(2):-!.
p(3).

%p(X).? -->Toma el valor del primer hecho (1), en la siguiente iteración 
%	   toma el valor 2 y ejecuta el corte, por lo que no llega a tomar el valor
%	   del tercer hecho (2).


%p(X),P(Y).?--> Primero X toma el mismo valor de Y, en la primera rama del arbol de backtraking,
%		la X toma el valor 1 y por lo tanto Y tambien toma el mismo valor. 
%		Luego, X 
%		
%		En la primer rama del arbol de backtraking X unifica con el primer hecho (1),
%		por lo que la siguiente pregunta objetivo seria p(1),p(Y), de aqui surgen 3 posibilidades
%		En la primera rama Y unifica con 1, por lo tanto ya tenemos la primer respuesta: X = Y = 1.
%		La siguiente rama a evaluar será Y = 2, mientras X sigue siendo 1. X = 1, Y = 2.
%		Luego de Y = 2, se ejecuta el corte, por lo que el siguiente valor ya no se considera.
%		Luego 

%P(X), ! , P(Y).
