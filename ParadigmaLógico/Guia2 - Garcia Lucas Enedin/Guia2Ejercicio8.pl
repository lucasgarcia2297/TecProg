%Ejercicio 8 - Guia 2 [Paradigma L�gico].
%Escribir un programa en Prolog que recorra un �rbol binario y determine
% la profundidad del mismo.
%La representaci�n del �rbol ser� una lista con el siguiente formato:
%     [I, N, D] en donde:
%		I es una lista que representa el sub�rbol de la rama izquierda
%               N es el valor del nodo ra�z
%		D es una lista que representa el sub�rbol de la rama derecha
%	as� el �rbol:
%			    a
%			   / \
%			  b   e
%		 	 / \   \
%		 	c  d    f
%	estar�a representado por [[[c], b, [d]], a, [[], e, [f]]]
%	 Las ramas vac�as se representan con una lista vac�a, y las hojas 
%	como una lista de un solo elemento.

% Ej.: profundidad([[[c], b, [d]], a, [[], e, [f]]], Profundidad). 
%		 	=> Profundidad = 3.

%profundidad(Arbol,Profundidad).
profundidad([],0).  %Sin Hijos
profundidad([_],1). %Una Hoja
profundidad([I,_,D],Resultado):-profundidad(I,PI),profundidad(D,PD),PI>PD,Resultado is PI+1.
profundidad([I,_,D],Resultado):-profundidad(I,PI),profundidad(D,PD),PI=<PD,Resultado is PD+1.