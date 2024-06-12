%Reemplazar.

%Nombre de Parámetros:
%	O: Objetivo.
%	R: Reemplazo.
%	I: Intancia.
%	C: CantidadMaxima.-->-1 reemplaza todo, valor positivo cantidad de reemplazos.
%	L: Lista.
%	S: Resultado Solución.
reemplazar(_,_,_,_,[],[]):-!.
reemplazar(_,_,_,0,Lista,Lista):-!.
reemplazar(_,_,I,_,_,_):-
			I<1,
			write('El valor de inicio debe ser mayor o igual a 1.\n'),
			!,fail.


%Objetivo IN cabecera

%Instancia = 1, Cantidad = -1 (Reemplaza todos).
reemplazar(O,R,1,-1,[O|Resto],[R|S]):-reemplazar(O,R,1,-1,Resto,S),!.

%Instancia = 1, Cantidad 1 o más.
reemplazar(O,R,1,C,[O|Resto],[R|S]):-C>0,C2 is C-1,reemplazar(O,R,1,C2,Resto,S),!.

%Intancia = 2, Cantidad 
reemplazar(O,R,I,C,[Y|Resto],[Y|S]):-I>1,I2 is I-1,reemplazar(O,R,I2,C,Resto,S),!.

%Objetivo NOT IN Cabecera.
reemplazar(O,R,I,-1,[Y|Resto],[Y|S]):-reemplazar(O,R,I,-1,Resto,S),!.
reemplazar(O,R,I,C,[Y|Resto],[Y|S]):-reemplazar(O,R,I,C,Resto,S),!.

%Este corte debe ir abajo
reemplazar(_,_,_,C,_,_):-C<1,
			write('La cantidad de reemplazos debe ser -1 o mayor o igual 1.\n'),
			!,fail.

