%Archivo:      database.pl
%Autor:        Emanuel Antonio Marín Gutiérrez
%
%Descripción:  Base de datos general del programa


%arco(CiudadOrigen, CiudadDestino, DistanciaKm, TiempoEstimado, TiempoEstimadoEnPresa).

%---------------------Cantón de Cartago------------------------

arco(agua-caliente, carmen, 5.8, 15, 25).
arco(agua-caliente, corralillo, 22.0, 42, 52).
arco(agua-caliente, dulce-nombre, 1.1, 3, 13).
arco(agua-caliente, guadalupe, 5.8, 13, 23).
arco(agua-caliente, llano-grande, 13.0, 24, 34).
arco(agua-caliente, occidental, 3.4, 8, 18).
arco(agua-caliente, oriental, 2.8, 5, 15).
arco(agua-caliente, quebradilla, 9.6, 18, 28).
arco(agua-caliente, san-nicolas, 9.5, 18, 28).
arco(agua-caliente, tierra-blanca, 10.0, 25, 35).

arco(carmen, agua-caliente, 5.3, 12, 22).
arco(carmen, corralillo, 26.0, 46, 56).
arco(carmen, dulce-nombre, 5.2, 12, 22).
arco(carmen, guadalupe, 7.2, 14, 24).
arco(carmen, llano-grande, 8.9, 15, 25).
arco(carmen, occidental, 3.6, 9, 19).
arco(carmen, oriental, 3.2, 9, 19).
arco(carmen, quebradilla, 14.0, 23, 33).
arco(carmen, san-nicolas, 6.6, 11, 21).
arco(carmen, tierra-blanca, 5.6, 14, 24).

arco(corralillo, agua-caliente, 22.0, 42, 52).
arco(corralillo, carmen, 25.0, 49, 59).
arco(corralillo, dulce-nombre, 23.0, 45, 55).
arco(corralillo, guadalupe, 19.0, 35, 45).
arco(corralillo, llano-grande, 32.0, 57, 67).
arco(corralillo, occidental, 22.0, 41, 51).
arco(corralillo, oriental, 23.0, 44, 54).
arco(corralillo, quebradilla, 13.0, 25, 35).
arco(corralillo, san-nicolas, 25.0, 45, 55).
arco(corralillo, tierra-blanca, 31.0, 59, 69).

arco(dulce-nombre, agua-caliente, 1.1, 4, 14).
arco(dulce-nombre, carmen, 5.5, 15, 25).
arco(dulce-nombre, corralillo, 23.0, 44, 54).
arco(dulce-nombre, guadalupe, 6.0, 14, 24).
arco(dulce-nombre, llano-grande, 13.0, 23, 33).
arco(dulce-nombre, occidental, 3.3, 8, 18).
arco(dulce-nombre, oriental, 2.6, 6, 16).
arco(dulce-nombre, quebradilla, 11.0, 21, 31).
arco(dulce-nombre, san-nicolas, 9.4, 18, 28).
arco(dulce-nombre, tierra-blanca, 14.0, 26, 36).

arco(guadalupe, agua-caliente, 6.2, 12, 22).
arco(guadalupe, carmen, 6.4, 16, 26).
arco(guadalupe, corralillo, 19.0, 36, 46).
arco(guadalupe, dulce-nombre, 6.1, 13, 23).
arco(guadalupe, llano-grande, 13.0, 25, 35).
arco(guadalupe, occidental, 3.4, 7, 17).
arco(guadalupe, oriental, 4.2, 10, 20).
arco(guadalupe, quebradilla, 6.8, 13, 23).
arco(guadalupe, san-nicolas, 6.2, 13, 23).
arco(guadalupe, tierra-blanca, 11.0, 25, 35).

arco(llano-grande, agua-caliente, 13.0, 23, 33).
arco(llano-grande, carmen, 8.9, 15, 25).
arco(llano-grande, corralillo, 33.0, 56, 66).
arco(llano-grande, dulce-nombre, 13.0, 23, 33).
arco(llano-grande, guadalupe, 14.0, 23, 33).
arco(llano-grande, occidental, 11.0, 18, 28).
arco(llano-grande, oriental, 10.0, 19, 29).
arco(llano-grande, quebradilla, 20.0, 33, 43).
arco(llano-grande, san-nicolas, 6.9, 14, 24).
arco(llano-grande, tierra-blanca, 6.0, 12, 22).

arco(occidental, agua-caliente, 3.5, 8, 18).
arco(occidental, carmen, 3.4, 11, 21).
arco(occidental, corralillo, 22.0, 40, 50).
arco(occidental, dulce-nombre, 3.4, 8, 18).
arco(occidental, guadalupe, 3.5, 8, 18).
arco(occidental, llano-grande, 10.0, 21, 31).
arco(occidental, oriental, 1.3, 4, 14).
arco(occidental, quebradilla, 9.4, 17, 27).
arco(occidental, san-nicolas, 6.1, 11, 21).
arco(occidental, tierra-blanca, 8.7, 21, 31).

arco(oriental, agua-caliente, 2.5, 4, 14).
arco(oriental, carmen, 3.5, 11, 21).
arco(oriental, corralillo, 23.0, 43, 53).
arco(oriental, dulce-nombre, 2.4, 5, 15).
arco(oriental, guadalupe, 4.5, 11, 21).
arco(oriental, llano-grande, 11.0, 20, 30).
arco(oriental, occidental, 1.0, 3, 13).
arco(oriental, quebradilla, 10.0, 20, 30).
arco(oriental, san-nicolas, 7.2, 15, 25).
arco(oriental, tierra-blanca, 13.0, 23, 33).

arco(quebradilla, agua-caliente, 9.5, 20, 30).
arco(quebradilla, carmen, 13.0, 26, 36).
arco(quebradilla, corralillo, 13.0, 25, 35).
arco(quebradilla, dulce-nombre, 11.0, 22, 32).
arco(quebradilla, guadalupe, 6.8, 12, 22).
arco(quebradilla, llano-grande, 19.0, 34, 44).
arco(quebradilla, occidental, 9.9, 18, 28).
arco(quebradilla, oriental, 11.0, 20, 30).
arco(quebradilla, san-nicolas, 13.0, 22, 32).
arco(quebradilla, tierra-blanca, 18.0, 36, 46).

arco(san-nicolas, agua-caliente, 11.0, 19, 29).
arco(san-nicolas, carmen, 6.1, 16, 26).
arco(san-nicolas, corralillo, 25.0, 45, 55).
arco(san-nicolas, dulce-nombre, 11.0, 20, 30).
arco(san-nicolas, guadalupe, 6.4, 12, 22).
arco(san-nicolas, llano-grande, 6.9, 16, 26).
arco(san-nicolas, occidental, 7.9, 15, 25).
arco(san-nicolas, oriental, 8.7, 18, 28).
arco(san-nicolas, quebradilla, 13.0, 22, 32).
arco(san-nicolas, tierra-blanca, 12.0, 26, 36).

arco(tierra-blanca, agua-caliente, 10.0, 21, 31).
arco(tierra-blanca, carmen, 5.7, 14, 24).
arco(tierra-blanca, corralillo, 31.0, 60, 70).
arco(tierra-blanca, dulce-nombre, 10.0, 22, 32).
arco(tierra-blanca, guadalupe, 11.0, 23, 33).
arco(tierra-blanca, llano-grande, 6.0, 12, 22).
arco(tierra-blanca, occidental, 8.8, 19, 29).
arco(tierra-blanca, oriental, 8.0, 19, 29).
arco(tierra-blanca, quebradilla, 18.0, 33, 43).
arco(tierra-blanca, san-nicolas, 12.0, 22, 32).

arco(a, b, 12.2, 21, 31).
arco(a, w, 3.0, 10, 20).
arco(w, c, 4.2, 12, 22).
arco(b, c, 5.1, 12, 22).
arco(c, d, 32.0, 45, 55).
arco(c, f, 23.7, 33, 43).
arco(d, e, 8.2, 17, 27).



%----------------------------Reglas Básicas--------------------------------

dame_origen(Arco, CiudadOrigen)  :- arg(1, Arco, CiudadOrigen).
dame_destino(Arco, CiudadDestino):- arg(2, Arco, CiudadDestino).
dame_distancia(Arco, DistanciaKm):- arg(3, Arco, DistanciaKm).
dame_tiempo(Arco, TiempoEstimado):- arg(4, Arco, TiempoEstimado).
dame_tiempo_presa(Arco, TiempoEstimadoEnPresa):- arg(5, Arco, TiempoEstimadoEnPresa).

dame_lista_origen(Destino, ListaOrigen)  :- findall(Origen,  arco(Origen, Destino,_,_,_), ListaOrigen).
dame_lista_destino(Origen, ListaDestino) :- findall(Destino, arco(Origen, Destino,_,_,_), ListaDestino).
dame_tiempos(Origen, Destino, Tiempos)   :- arco(Origen, Destino,_,T1,T2), Tiempos = [T1,T2].

existe_lugar(Lugar):- arco(Lugar,_,_,_,_), !; arco(_,Lugar,_,_,_), !.

existe_ruta(Origen, Destino):- arco(Origen, Destino,_,_,_).
existe_ruta(Origen, Destino):- arco(Origen,Intermedio,_,_,_), existe_ruta(Intermedio, Destino).

dame_ruta(Origen, Destinos, Ruta):- length(Destinos, Cantidad), Cantidad == 1, dame_nodo(Destinos, Nodo),
    ruta_directa(Origen, Nodo, Ruta).
dame_ruta(Origen, Destinos, Ruta):- length(Destinos, Cantidad), Cantidad > 1, dame_ruta_aux(Origen, Destinos, Ruta).


dame_nodo([Cabeza|_],Cabeza).

ruta_directa(Origen, Destino, Ruta):- arco(Origen, Destino, Distancia, _, _), Lista = [Origen, Destino, Distancia],
    Ruta = [Lista].
ruta_directa(Origen, Destino, Ruta):- arco(Origen, Intermedio, D1, _, _), Li = [Origen, Intermedio, D1],
    ruta_directa(Intermedio, Destino, Rf), Ruta = [Li|Rf].

dame_ruta_aux(Origen,[],Ruta):- Ruta = [],!.
dame_ruta_aux(Origen, [Cabeza|Lista], Ruta):- ruta_directa(Origen, Cabeza, R1), dame_ruta_aux(Cabeza, Lista, Rf),
    concatenar(R1,Rf,Ruta).

concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).

distancia_total(Origen, Destino, DistanciaTotal):- arco(Origen, Destino, DistanciaTotal,_,_).
distancia_total(Origen, Destino, DistanciaTotal):- arco(Origen,Intermedio,Di,_,_),
    distancia_total(Intermedio, Destino, Df), DistanciaTotal is Di+Df.

tiempo_total(Origen, Destino, Ttotal):- arco(Origen, Destino, _, Ttotal, _).
tiempo_total(Origen, Destino, Ttotal):- arco(Origen, Intermedio, _, Ti, _),
    tiempo_total(Intermedio, Destino, Tf), Ttotal is Ti+Tf.

tiempo_presa_total(Origen, Destino, TPtotal):- arco(Origen, Destino, _, _, TPtotal).
tiempo_presa_total(Origen, Destino, TPtotal):- arco(Origen, Intermedio, _, _, TPi),
    tiempo_presa_total(Intermedio, Destino, TPf), TPtotal is TPi+TPf.

tiempos_totales(Origen, Destino, Tiempos):- tiempo_total(Origen, Destino, Ttotal),
    tiempo_presa_total(Origen, Destino, TPtotal), Tiempos = [Ttotal, TPtotal].


%---------------------------------Algunas Pruebas---------------------------------

test1(Arco):- write(Arco), nl,
    write("CiudadOrigen: "),          dame_origen(Arco, CiudadOrigen),      write(CiudadOrigen),   nl,
    write("CiudadDestino: "),         dame_destino(Arco, CiudadDestino),    write(CiudadDestino),  nl,
    write("DistanciaKm: "),           dame_distancia(Arco, DistanciaKm),    write(DistanciaKm),    nl,
    write("TiempoEstimado: "),        dame_tiempo(Arco, TiempoEstimado),    write(TiempoEstimado), nl,
    write("TiempoEstimadoEnPresa: "), dame_tiempo_presa(Arco, TiempoPresa), write(TiempoPresa),    nl.

test2(Origen):- write("Lista ciudades de destino: \n"),
                dame_lista_destino(Origen, ListaDestino),
                print_destino(ListaDestino).

print_destino([]):- !.
print_destino([C|ListaDestino]):- write(C), nl, print_destino(ListaDestino).

