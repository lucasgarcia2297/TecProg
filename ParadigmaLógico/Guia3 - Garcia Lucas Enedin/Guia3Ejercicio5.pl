semejanza([],[],0):-!.
semejanza([],[_|R],S):-semejanza([],R,S2),S is S2-1,!.
semejanza([_|R],[],S):-semejanza(R,[],S2),S is S2-1,!.
semejanza([X|R1],[X|R2],S):-X=X,semejanza(R1,R2,S2),S is S2+1,!.
semejanza([_|R1],[_|R2],S):-semejanza(R1,R2,S2),S is S2-1.
