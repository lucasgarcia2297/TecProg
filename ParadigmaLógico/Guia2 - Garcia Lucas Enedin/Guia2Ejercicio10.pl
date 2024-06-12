%Ejercicio 10 - Guia 2 [Paradigma Lógico]
% Escriba un programa en Prolog que recursivamente ordene una lista de 
%	números enteros.
% Ej.: ordenar([2, 4, 3, 1], ListaOrdenada).
%			 => ListaOrdenada = [1, 2, 3, 4].

%Funcion auxiliar que inserta un elemento de forma ordenada.
%insertar(Elemento,Lista,Resultado).
insertar(X,[],[X]).
insertar(X,[Y|R],[X,Y|R]):-X<Y.
insertar(X,[Y|R],[Y|L]):-X>Y,insertar(X,R,L).
insertar(X,[X|R],[X|R]). %En caso de que sean iguales

%ordenar(ListDesordenada, ListOrdenada).
ordenar([],[]).
ordenar([X|R1],LO):-ordenar(R1,LR),insertar(X,LR,LO).
