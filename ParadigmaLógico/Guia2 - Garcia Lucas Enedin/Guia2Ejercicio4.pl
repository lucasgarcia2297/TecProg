%Ejercicio 4 - Guia 2 [Paradigma L�gico]
%  Escriba un programa en Prolog que dada una lista de n�meros enteros, 
%   calcule el resultado de sumar dichos n�meros.
% Ej.: suma([1, 2, 3], X). => X = 6.

suma([],0).
suma([X|R],S):-integer(X),suma(R,S2),S is S2+X.