semejanza([],[],0):-!.   
semejanza([],[_|C],S):-semejanza([],C,S1),S is S1-1,!.
semejanza([_|C],[],S):-semejanza(C,[],S1),S is S1-1,!.
semejanza([X|C1],[X|C2],S):-semejanza(C1,C2,S1),S is S1+1,!.
semejanza([_|C1],[_|C2],S):-semejanza(C1,C2,S1),S is S1-1.

dic([sanar, hola, sabana, sabalo, prueba, computadora, cartera, mate, termo, mesa, silla, sarna]).

miembro(X,[X|_]):-!.
miembro(X,[_|R]):-miembro(X,R).

comparar(X,Y,S):-atom_chars(X,L1),atom_chars(Y,L2),semejanza(L1,L2,S),!.

buscarsemejante(_,[],[]):-!.
buscarsemejante(X,[P|C],R):-comparar(X,P,S),S>=0,buscarsemejante(X,C,R2), R =[[P,S]|R2],!.
buscarsemejante(X,[P|C],R):-comparar(X,P,S),S<0,buscarsemejante(X,C,R).

buscar(X,R):-dic(D),miembro(X,D),R = [X],!.
buscar(X,R):-dic(D),buscarsemejante(X,D,R).

