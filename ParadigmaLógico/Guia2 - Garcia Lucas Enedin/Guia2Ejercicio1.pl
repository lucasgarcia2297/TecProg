%N = Número, F=Factorial.
factorial(0,1).
factorial(N,F):-N>0,N1 is N-1,factorial(N1,F1), F is N*F1.

%Consulta: factorial(5,120).
%Salida: True.
%Consulta: factorial(5,F).
%Salida: 120.
%Consulta: factorial(0,F).
%Salida: 1.
