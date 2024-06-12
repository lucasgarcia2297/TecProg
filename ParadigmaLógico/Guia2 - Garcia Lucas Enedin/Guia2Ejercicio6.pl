%Ejercicio 6 - Guia 2 [Paradigma Lógico]
%  Escribir un programa en Prolog que reciba dos listas de números, 
%   verifiquen que sean de la misma longitud, y luego retorne una lista 
%   con la suma elemento a elemento de ambas listas.
%  Ej.: suma_lista([1, -2, 3, -4], [2, 3, 1, 4], ListaSuma).
%						 => ListaSuma = [3, 1, 4, 0].

longitud([],0).
longitud([_|R],Long):-longitud(R,Long2),Long is Long2+1.

suma_lista([],[],[]).
suma_lista([X1|R1],[X2|R2],[X3|L]):-longitud([X1|R1],Long),longitud([X2|R2],Long),
				suma_lista(R1,R2,L),X3 is X1+X2.
