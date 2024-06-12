%cantidad/2: L=lista, C=cantidad 
cantidad([],0). 	%lista vacía => 0 elementos
cantidad([_|R],C):-cantidad(R,C1),C is C1+1.  %Recursion (va sumandole 1)

%Consulta: cantidad([],C).
%Salida: C=0.
%Consulta: cantidad([e1,e2,e3],C).
%Salida: C=3.
%Consulta: cantidad([e1,e2,e3],3).
%Salida: true.
