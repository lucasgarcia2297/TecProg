%Escriba un programa en Prolog que dada una lista de números enteros, retorne otra lista
%solo con los números positivos de la misma.
%	Ej.: positivos([1, -2, 3, -4], ListaPositivos). => ListaPositivos = [1, 3]

%positivos/2: L = lista inicial, P = lista de positivos

%concatenar(L1,L2,LC).
concatenar([],L2,L2).
concatenar(L1,[],L1).
concatenar([X|R1],L2,[X|LC]):-concatenar(R1,L2,LC).


positivos([],[]).
%positivos([X|R1],L):-integer(X),X>=0,positivos(R1,L1),concatenar([X],L1,L).
positivos([X|R1],[X|R2]):-integer(X),X>=0,positivos(R1,R2).
positivos([X|R1],R2):-integer(X),X<0,positivos(R1,R2).