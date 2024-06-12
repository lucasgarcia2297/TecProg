agregar_nuevo(X,[],[X]):-!.
agregar_nuevo(X,[X|R],[X|R]):-!.
agregar_nuevo(X,[Y|R],[Y|R2]):-X\=Y,agregar_nuevo(X,R,R2).