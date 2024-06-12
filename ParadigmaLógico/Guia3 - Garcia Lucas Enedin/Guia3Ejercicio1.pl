%Ejercicio 1 - Guia3 [Paradigma Lógico].

% Dado el siguiente programa en Prolog que calcula el factorial 
%  de un número:
%	factorial(0, 1).
%	factorial(Numero, Factorial) :- Numero > 0,
%					NumeroAnt is Numero - 1,
%					factorial(NumeroAnt, FactorialAnt),
%					Factorial is Numero * FactorialAnt.
% El resultado de evaluar “factorial(5, X).” es:
%						X = 120;
%						false.
% Utilice un operador de corte donde corresponda para que el programa 
%  finalice una vez terminada la recursión y no retorne el “false” final.

factorial(0,1):-!.
factorial(Numero, Factorial):-Numero>0,
			      NumeroAnt is Numero-1,
			      factorial(NumeroAnt,FactorialAnt),
			      Factorial is Numero*FactorialAnt.

