%Biblioteca

lecturaDensa(libro(_, _,CantidadDePaginas)):-
    CantidadDePaginas>=200.
lecturaDensa(libro(_, Editorial,_)):-
    Editorial == paidos.
lecturaDensa(paper(_,CantidadDeHojas,CantidadDeVisitas)):-
    (CantidadDeHojas-CantidadDeVisitas)>100.
lecturaDensa(saga(_,CantidadDeLibros)):-
    CantidadDeLibros>4.

leyo(nico, saga(dune,14)).
leyo(nico, libro(rebelionEnLaGranja,deBolsillo,144)).
leyo(nico, paper("No Silver Bullet: Essence and Accidents of Software Engineering", 230, 100)).
leyo(nico, paper("The relationship between design and verification", 250, 300)).

leyo(daiu, saga(fundacion,7)).
leyo(daiu, libro(elAleph,paidos,146)).

leyo(clara, paper("Evidence for a Distant Giant Planet in the Solar System", 170, 30)).
leyo(clara, paper("No Silver Bullet: Essence and Accidents of Software Engineering", 230, 100)).
leyo(clara, libro(rayuela,alfaguara,600)).
leyo(clara, saga(harryPotter,7)).

leyo(juan, libro(cosmos,planeta,362)).
leyo(juan, saga(elSeniorDeLosAnillos,3)).

leyo(flor, saga(harryPotter,7)).
/*
Usando el predicado lecturaDensa/1 definido para el ejercicio anterior, definir un predicado 
lectorIntenso/1 para saber si una persona prefiere la lectura intensa. Esto sucede cuando leyó 
más de un material de lectura (que podrían ser dos libros distintos, un paper y un libro, etc) y 
todo lo que leyó es denso.

Contamos además con un predicado leyo/2 que relaciona a una persona con cada material 
de lectura que leyó.

Se espera que el predicado lectorIntenso/1 sea inversible.

*/
%% SOLUCIÓN
lectorIntenso(Lector):- 
    leyo(Lector,_),
    forall(leyo(Lector,Material),lecturaDensa(Material)),
    leyoMasDeUno(Lector).

leyoMasDeUno(Lector):-
    leyo(Lector,Material1),
    leyo(Lector,Material2),
    Material1 \= Material2.

