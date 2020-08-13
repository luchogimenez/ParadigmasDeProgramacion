/* 
Ejercicio 1:  Gustos de comidas
Cinco amigos deciden juntarse a comer en un bar del que se sabe cuáles son las comidas que ofrece 
y cuánto sale cada una de ellas:
*/

precio(asado,450).
precio(hamburguesa,350).
precio(papasFritas,220).
precio(ensalada,190).

tieneCarne(asado).
tieneCarne(hamburguesa).

/*
Desarrollar un predicado leGusta/2 que relacione a cada amigo con cada comida de su agrado 
de las que están en el bar sabiendo que:*/

% A Juan y Gabriela les gusta el asado.
leGusta(juan,asado).
leGusta(gabriela,asado).
% A Soledad le gustan las papas fritas y también las comidas que tienen carne y salen menos de $400.
leGusta(soledad,papasFritas).
leGusta(soledad,Comida):- tieneCarne(Comida),
  precio(Comida,Precio),
  Precio<400.

% A Celeste le gusta todo lo que el bar ofrece.
leGusta(celeste,Comida):-precio(Comida,_).

% Carlos tiene problemas con el dueño del bar, por eso no le gusta nada de lo que ofrece.
leGusta(carlos,Comida):-not(precio(Comida,_)).

/*
Por ejemplo, esta consulta debería ser cierta:

   leGusta(celeste, hamburguesa).
   true

Además el predicado leGusta/2 debería ser totalmente inversible.
Tener en cuenta que si se agregaran otras comidas o cambiaran los precios del bar, el programa 
tiene que seguir funcionando correctamente en base a lo que se describió anteriormente.
*/