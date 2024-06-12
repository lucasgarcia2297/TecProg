%Ejercicio 9 - Guia2 [Paradigma Lógico]
% Escriba un programa en Prolog que dada una lista numérica ordenada, 
%	inserte un elemento en el lugar correspondiente según el orden.
%  Ej.: insertar(3, [1, 2, 4, 5], Resultado). 
%			=> Resultado = [1, 2, 3, 4, 5].


%insertar(Elemento,Lista,Resultado).
insertar(X,[],[X]).
insertar(X,[Y|R],[X,Y|R]):-X<Y.
insertar(X,[Y|R],[Y|L]):-X>Y,insertar(X,R,L).
insertar(X,[X|R],[X|R]). %En caso de que sean iguales