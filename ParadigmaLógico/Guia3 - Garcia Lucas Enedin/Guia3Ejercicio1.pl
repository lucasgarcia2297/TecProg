%Ejercicio 1 - Guia3 [Paradigma L�gico].

% Dado el siguiente programa en Prolog que calcula el factorial 
%  de un n�mero:
%	factorial(0, 1).
%	factorial(Numero, Factorial) :- Numero > 0,
%					NumeroAnt is Numero - 1,
%					factorial(NumeroAnt, FactorialAnt),
%					Factorial is Numero * FactorialAnt.
% El resultado de evaluar �factorial(5, X).� es:
%						X = 120;
%						false.
% Utilice un operador de corte donde corresponda para que el programa 
%  finalice una vez terminada la recursi�n y no retorne el �false� final.

factorial(0,1):-!.
factorial(Numero, Factorial):-Numero>0,
			      NumeroAnt is Numero-1,
			      factorial(NumeroAnt,FactorialAnt),
			      Factorial is Numero*FactorialAnt.

