%Ejercicio 11 - Guia 2 [Paradigma Lógico].

%Escribir un programa en Prolog que aplane una lista. 
% El predicado aplanar/2 recibe una lista cuyos elementos pueden ser otras 
% listas y debe retornar una lista con todos los elemento atómicos presentes.
%Ej.: aplanar([1, 2, 3], ListaPlana) . => ListaPlana = [1, 2, 3]
%Ej.: aplanar([1, 2, [3]], ListaPlana) . => ListaPlana = [1, 2, 3]
%Ej.: aplanar([1, [2, [3]]], ListaPlana) . => ListaPlana = [1, 2, 3]

%Funcion auxiliar para concatenar 2 listas
concatenar([],L2,L2).
concatenar([X|R],L2,[X|LC]):-concatenar(R,L2,LC).

%caso 1: lista vacia
aplanar([],[]). 
%caso 2: el primer elemento es una lista. ([X|R1] es la sublista)
aplanar([[X|R1]|R2],LP1):-aplanar([X|R1],LP2),aplanar(R2,R3),concatenar(LP2,R3,LP1).
%caso 3: primer elemento una lista vacia.
aplanar([[]|R1],LP1):-aplanar(R1,LP1),!.
%caso 4: el primer elemento es solo un elemento.
aplanar([X|R1],[X|LP1]):-aplanar(R1,LP1),!.


