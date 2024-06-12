mayusculas([X]):-char_code(X,C),C<90,C>65.
mayusculas([X|_]):-char_code(X,C),C<90,C>65.

tamanio([],0).
tamanio([_|R],S):-tamanio(R,S2),S is S2+1. 


%secuencia([X])

passValidator(P):-string_chars(P,L),L = [],write('La contraseña no puede estar vacia.'),!.

passValidator(P):-string_chars(P,[X|_]),char_code(X,C),C>48,C<57,write('La entrada no es un String.'),!.
passValidator(P):-string_chars(P,L),tamanio(L,T),T>12,write('La clave debe contener entre 8 y 12 caracteres.'),!.
passValidator(P):-string_chars(P,L),tamanio(L,T),T<8,write('La clave debe contener entre 8 y 12 caracteres.'),!.
passValidator(P):-string_chars(P,L),not(mayuscula(L)),write('La clave debe contener al menos una letra mayúscula.').
%passValidator(P):-string_chars(P,L),secuencia(L).