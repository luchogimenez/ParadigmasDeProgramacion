% Ejemplos para predicados iniciales

jugador(rojo).
ubicadoEn(argentina, americaDelSur).
aliados(rojo, amarillo).
ocupa(rojo, argentina).
limitrofes(argentina, brasil).

% tienePresenciaEn/2: Relaciona un jugador con un continente del cual ocupa, al menos, un país.

tienePresenciaEn(Jugador, Continente):-
    ocupa(Jugador,Pais),
    ubicadoEn(Pais, Continente).

% puedenAtacarse/2: Relaciona dos jugadores si uno ocupa al menos un país limítrofe a algún país ocupado por el otro.

puedenAtacarse(UnJugador, OtroJugador):-
    ocupa(UnJugador, UnPais),
    ocupa(OtroJugador, OtroPais),
    limitrofes(UnPais, OtroPais).

% sinTensiones/2: Relaciona dos jugadores que, o bien no pueden atacarse, o son aliados.

sinTensiones(UnJugador, OtroJugador):-
    jugador(UnJugador), jugador(OtroJugador),
    not(puedenAtacarse(UnJugador, OtroJugador)).
sinTensiones(UnJugador, OtroJugador):- aliados(UnJugador, OtroJugador).

% perdió/1: Se cumple para un jugador que no ocupa ningún país.

perdio(Jugador):-
    jugador(Jugador),
    not(ocupa(Jugador,_)).

% controla/2: Relaciona un jugador con un continente si ocupa todos los países del mismo.

controla(Jugador, Continente):-
    jugador(Jugador), ubicadoEn(_, Continente),
    forall(ubicadoEn(Pais, Continente), ocupa(Jugador, Pais)).
controla2(Jugador, Continente):-
    jugador(Jugador), ubicadoEn(_, Continente),
    not((ubicadoEn(Pais, Continente), not(ocupa(Jugador, Pais)))).

% reñido/1: Se cumple para los continentes donde todos los jugadores ocupan algún país.

renido(Continente):-
     ubicadoEn(_, Continente),
    forall(jugador(Jugador), (ocupa(Jugador, Pais), ubicadoEn(Pais, Continente))).

renido2(Continente):-
    ubicadoEn(_, Continente),
    not((jugador(Jugador), not((ocupa(Jugador, Pais), ubicadoEn(Pais, Continente))))).

% atrincherado/1: Se cumple para los jugadores que ocupan países en un único continente.

atrincherado(Jugador):-
    ocupa(Jugador, Pais), ubicadoEn(Pais, Continente),
    forall(ocupa(Jugador, OtroPais), ubicadoEn(OtroPais, Continente)).

atrincherado2(Jugador):-
    ocupa(Jugador, Pais), ubicadoEn(Pais, Continente),
    not((ocupa(Jugador, OtroPais), not(ubicadoEn(OtroPais, Continente)))).

% puedeConquistar/2: Relaciona un jugador con un continente si no lo controla, pero todos los países del continente que le falta ocupar son limítrofes a alguno que sí ocupa y pertenecen a alguien que no es su aliado.

puedeConquistar(Jugador, Continente):-
    jugador(Jugador), ubicadoEn(_, Continente),
    not(controla(Jugador, Continente)),
    forall(
        (ubicadoEn(Pais, Continente), not(ocupa(Jugador, Pais))),
        puedeAtacar(Jugador, Pais)
    ).

puedeAtacar(Jugador, Pais):-
  limitrofes(Pais, OtroPais), 
  ocupa(Jugador, OtroPais), 
  not((ocupa(OtroJugador, Pais), aliados(OtroJugador, Jugador))).