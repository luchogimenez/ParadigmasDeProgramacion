%Biblioteca
precio(asado,450).
precio(hamburguesa,350). 
precio(papasFritas,220). 
precio(ensalada,190). 
precio(revueltoGramajo, 220). 
precio(tresEmpanadas, 120). 
precio(pizza, 250). 

leGusta(pepe, pizza). 
leGusta(pipo, pizza). 
leGusta(tito, pizza). 
leGusta(toto, pizza). 
leGusta(tato, pizza). 
leGusta(pepe, revueltoGramajo). 
leGusta(pepe, hamburguesa). 
leGusta(pipo, ensalada). 
leGusta(tito, hamburguesa). 
leGusta(tito, tresEmpanadas). 
leGusta(toto, papasFritas). 
leGusta(tato, papasFritas). 
leGusta(tito, papasFritas). 
leGusta(pepe, papasFritas). 
leGusta(pipo, papasFritas).
/*
Ejercicio 4: Comida popular 
Nuevamente tenemos en nuestra base de conocimientos información sobre los precios de 
las comidas del menú de un bar (mediante un predicado precio/2) y los gustos de las 
personas (mediante un predicado leGusta/2). 
Definir los siguientes predicados: 
    • masBarata/2 que relaciona dos comidas si la primera es más barata que la segunda. 
*/
masBarata(Primera,Segunda):-
    precio(Primera,PrecioPrimera),
    precio(Segunda,PrecioSegunda),
    PrecioPrimera<PrecioSegunda.
/*
    • comidaPopular/1 que se cumple para una comida si le gusta a todas las personas 
    o si es la más barata de todas las comidas del menú. 
*/
comidaPopular(Comida):- 
    precio(Comida,_),
    forall(leGusta(Persona,_),leGusta(Persona,Comida)).
comidaPopular(Comida):- 
    precio(Comida,_),
    forall(masBarata(_,Comida2),masBarata(Comida,Comida2)).

/*
Se espera que ambos predicados sean inversibles. 
A continuación se muestran algunos ejemplos de lo que se espera en base a la 
información que disponemos en nuestra base de conocimientos: 

masBarata(pizza, asado). 
true 

masBarata(asado, pizza). 
false 

comidaPopular(tresEmpanadas). 
true 

comidaPopular(papasFritas). 
true 

comidaPopular(asado). 
false
*/
