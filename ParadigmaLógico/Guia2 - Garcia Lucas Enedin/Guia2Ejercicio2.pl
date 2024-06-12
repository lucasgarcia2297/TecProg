%contar/3:  X = elemento a contar, L = lista,C = cantidad.  

contar(_,[],0).
contar(X,[X|R],C):-contar(X,R,C1),C is C1+1.
contar(X,[Y|R],C):-X\=Y,contar(X,R,C).
