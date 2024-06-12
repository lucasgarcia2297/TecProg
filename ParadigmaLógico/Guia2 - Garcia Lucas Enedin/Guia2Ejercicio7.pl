%Ejercicio 7 - Guia 2 [Paradigma Lógico]
%Escriba un programa en Prolog que dada una lista elimine todos los elementos
% duplicados de la misma.
% 	Ej.: eliminar_dup([1, 2, 3, 1, 4, 3, 5, 6], SinDup). 
%					=> SinDup = [1, 2, 3, 4, 5, 6].

 
%Función auxiliar para eliminar las ocurrencias de X en una lista L
%eliminar_elemento(X,L,Limpia) 	=>X=Elemento a eliminar
%				=>L=Lista a analizar
%				=>Limpia = Lista obtenida al eliminar todos los elementos X.
eliminar_elemento(_,[],[]).
eliminar_elemento(E,[E|R],Resultado):-eliminar_elemento(E,R,Resultado).
eliminar_elemento(E,[X|R],[X|Resultado]):-E\=X,eliminar_elemento(E,R,Resultado).


%Funcion Principal
%eliminar_dup(LI,LF) => LI = Lista inicial, LF = Lista Final
eliminar_dup([],[]).
eliminar_dup([X|R],[X|F]):-eliminar_elemento(X,R,Limpia),eliminar_dup(Limpia,F).

 				