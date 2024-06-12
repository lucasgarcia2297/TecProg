%Ejercicio 4 - Guia 2 [Paradigma Lógico]
%  Escriba un programa en Prolog que dada una lista de números enteros, 
%   calcule el resultado de sumar dichos números.
% Ej.: suma([1, 2, 3], X). => X = 6.

suma([],0).
suma([X|R],S):-integer(X),suma(R,S2),S is S2+X.