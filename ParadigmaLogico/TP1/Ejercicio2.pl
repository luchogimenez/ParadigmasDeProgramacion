/* 
Ejercicio 2:  Comidas caras
Nuevamente tenemos en nuestra base de conocimientos información sobre los precios de las 
comidas del menú del bar mediante el predicado precio/2, y se agrega información relativa 
a cuál es el menú del día mediante un predicado menuDelDia/1.
*/

precio(asado,450).
precio(hamburguesa,350).
precio(papasFritas,220).
precio(fideos,380).
precio(ensalada,190).

menuDelDia(ensalada).


% Se pide desarrollar un predicado estaCaro/1 que se verifique para una comida si su precio 
% es por lo menos el doble del menú del día.
estaCaro(Comida):-
    precio(Comida,PrecioComida),
    precio(Menu,Preciomenu),
    menuDelDia(Menu),
    PrecioComida>=2*Preciomenu.
/*
Al igual que para el ejercicio anterior, se espera que el predicado estaCaro/1 sea inversible, 
y si se agregaran otras comidas, se cambiara el menú del día, o cambiaran los precios del bar, 
el programa tiene que seguir funcionando correctamente.
*/