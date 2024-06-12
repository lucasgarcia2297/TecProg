%Ejercicio 3 - Guia 3 [Paradigma Lógico] (Garcia Lucas)

%Implementar un predicado “eliminar_primero/3” que quite de una lista la 
% primera aparición de un determinado elemento, utilizar el operador de 
% corte donde considere necesario para garantizar que no se realicen 
% unificaciones innecesarias.
%Ej:
%  eliminar_primero([1, 2, 3, 1, 2, 3], 2, X).
%				=> X = [1, 3, 1, 2, 3].
%  eliminar_primero([1, 2, 3, 1, 2, 3], a, X).
%				=> X = [1, 2, 3, 1, 2, 3].

eliminar_primero([],_,[]).
eliminar_primero([X|R],X,R):-!.
eliminar_primero([Y|R],X,[Y|C]):-eliminar_primero(R,X,C).