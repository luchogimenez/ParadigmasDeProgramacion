%Biblioteca
leGusta(luis, asado). 
leGusta(luis, pizza). 
leGusta(luis, lomoAlChampignion). 
leGusta(luis, revueltoGramajo). 
leGusta(jose, pizza). 
leGusta(jose, ensalada). 
leGusta(jose, revueltoGramajo).
/*
Ejercicio 3: Los gustos de Andrea.
Continuando con la problemática de los gustos de comidas, queremos determinar cuáles
son las comidas que le gustan a Andrea. 
Sabemos que a Andrea le gustan todas las cosas que le gustan a Luis, excepto aquellas 
que también le gustan a Jose. Además a Andrea le gustan las achuras. 
Ya tenemos en nuestra base de conocimientos un predicado leGusta/2 que relaciona una 
persona con una comida que le gusta. Se pide extenderlo de forma conveniente para poder 
consultar los gustos de Andrea.
*/
leGusta(andrea,Comida):-leGusta(luis,Comida),not(leGusta(jose,Comida)).
leGusta(andrea,achuras).
/*
leGusta(andrea, lomoAlChampignion). 
true 

leGusta(andrea, pizza). 
false 

leGusta(andrea, achuras). 
true

Tener en cuenta que el predicado leGusta/2 debe ser inversible.
*/

