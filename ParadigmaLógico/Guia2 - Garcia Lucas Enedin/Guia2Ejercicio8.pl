%Ejercicio 8 - Guia 2 [Paradigma Lógico].
%Escribir un programa en Prolog que recorra un árbol binario y determine
% la profundidad del mismo.
%La representación del árbol será una lista con el siguiente formato:
%     [I, N, D] en donde:
%		I es una lista que representa el subárbol de la rama izquierda
%               N es el valor del nodo raíz
%		D es una lista que representa el subárbol de la rama derecha
%	así el árbol:
%			    a
%			   / \
%			  b   e
%		 	 / \   \
%		 	c  d    f
%	estaría representado por [[[c], b, [d]], a, [[], e, [f]]]
%	 Las ramas vacías se representan con una lista vacía, y las hojas 
%	como una lista de un solo elemento.

% Ej.: profundidad([[[c], b, [d]], a, [[], e, [f]]], Profundidad). 
%		 	=> Profundidad = 3.

%profundidad(Arbol,Profundidad).
profundidad([],0).  %Sin Hijos
profundidad([_],1). %Una Hoja
profundidad([I,_,D],Resultado):-profundidad(I,PI),profundidad(D,PD),PI>PD,Resultado is PI+1.
profundidad([I,_,D],Resultado):-profundidad(I,PI),profundidad(D,PD),PI=<PD,Resultado is PD+1.