:-dynamic rpath/2.

%Archivo:      database.pl
%Autor:        Emanuel Antonio Marín Gutiérrez
%
%Descripción:  Base de datos general del programa

%---------------------BASE DE CONOCIMIENTOS--------------------

%arco(CiudadOrigen, CiudadDestino, DistanciaKm, TiempoEstimado, TiempoEstimadoEnPresa).
arco(agua-caliente, corralillo, 22.0, 42, 52).
arco(agua-caliente, dulce-nombre, 1.1, 3, 13).
arco(agua-caliente, guadalupe, 5.8, 13, 23).
arco(agua-caliente, llano-grande, 13.0, 24, 34).

arco(carmen, agua-caliente, 5.3, 12, 22).
arco(carmen, corralillo, 26.0, 46, 56).
arco(carmen, dulce-nombre, 5.2, 12, 22).
arco(carmen, guadalupe, 7.2, 14, 24).
arco(carmen, llano-grande, 8.9, 15, 25).

arco(corralillo, agua-caliente, 22.0, 42, 52).
arco(corralillo, carmen, 25.0, 49, 59).
arco(corralillo, dulce-nombre, 23.0, 45, 55).
arco(corralillo, guadalupe, 19.0, 35, 45).
arco(corralillo, llano-grande, 32.0, 57, 67).

arco(dulce-nombre, agua-caliente, 1.1, 4, 14).
arco(dulce-nombre, carmen, 5.5, 15, 25).
arco(dulce-nombre, corralillo, 23.0, 44, 54).
arco(dulce-nombre, guadalupe, 6.0, 14, 24).
arco(dulce-nombre, llano-grande, 13.0, 23, 33).

arco(guadalupe, agua-caliente, 6.2, 12, 22).
arco(guadalupe, carmen, 6.4, 16, 26).
arco(guadalupe, corralillo, 19.0, 36, 46).
arco(guadalupe, dulce-nombre, 6.1, 13, 23).
arco(guadalupe, llano-grande, 13.0, 25, 35).

arco(llano-grande, agua-caliente, 13.0, 23, 33).
arco(llano-grande, carmen, 8.9, 15, 25).
arco(llano-grande, corralillo, 33.0, 56, 66).
arco(llano-grande, dulce-nombre, 13.0, 23, 33).
arco(llano-grande, guadalupe, 14.0, 23, 33).

arco(a, b, 12.2, 21, 31).
arco(a, w, 3.0, 10, 20).
arco(w, c, 4.2, 12, 22).
arco(b, c, 5.1, 12, 22).
arco(c, d, 32.0, 45, 55).
arco(c, f, 23.7, 33, 43).
arco(d, e, 8.2, 17, 27).


%----------------------------REGLAS-------------------------------


/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dame_origen(Arco, CiudadOrigen)  :- arg(1, Arco, CiudadOrigen).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dame_destino(Arco, CiudadDestino):- arg(2, Arco, CiudadDestino).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dame_distancia(Arco, DistanciaKm):- arg(3, Arco, DistanciaKm).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dame_tiempo(Arco, TiempoEstimado):- arg(4, Arco, TiempoEstimado).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dame_tiempo_presa(Arco, TiempoEstimadoEnPresa):- arg(5, Arco, TiempoEstimadoEnPresa).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dame_lista_origen(Destino, ListaOrigen)  :- findall(Origen,  arco(Origen, Destino,_,_,_), ListaOrigen).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dame_lista_destino(Origen, ListaDestino) :- findall(Destino, arco(Origen, Destino,_,_,_), ListaDestino).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dame_tiempos(Origen, Destino, Tiempos)   :- arco(Origen, Destino,_,T1,T2), Tiempos = [T1,T2].

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
existe_lugar(Lugar):- arco(Lugar,_,_,_,_), !; arco(_,Lugar,_,_,_), !.

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dame_ruta(Origen, Destinos, Lista_Respuesta):-
    length(Destinos, Longitud), 
    Longitud == 1,
    dame_nodo(Destinos, Destino),
    dijkstra(Origen, Destino, [_|Ruta]),
    ruta_directa(Origen, Ruta, Lista_Respuesta), !.

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dame_ruta(Origen, Destinos, Lista_Respuesta):-
    length(Destinos, Longitud),
    Longitud > 1,
    dame_ruta_aux(Origen, Destinos, Lista_Respuesta).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dame_ruta_aux(_, [], Lista_Respuesta):- Lista_Respuesta = [], !.

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dame_ruta_aux(Origen, [Destino|Destinos], Lista_Respuesta):-
    dijkstra(Origen, Destino, [_|Ruta]),
    ruta_directa(Origen, Ruta, Lista_Inicial),
    dame_ruta_aux(Destino, Destinos, Lista_Final),
    concatenar(Lista_Inicial, Lista_Final, Lista_Respuesta).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
ruta_directa(_, [], Lista_Respuesta):- Lista_Respuesta = [], !.

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
ruta_directa(Origen, [Destino|Ruta], Lista_Respuesta):-
    ruta_directa_aux(Origen, Destino, Lista_Inicial),
    ruta_directa(Destino, Ruta, Lista_Final),
    concatenar(Lista_Inicial, Lista_Final, Lista_Respuesta).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
ruta_directa_aux(Origen, Destino, Ruta):-
    arco(Origen, Destino, Distancia, _, _),
    Lista = [Origen, Destino, Distancia],
    Ruta = [Lista].

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dame_nodo([Destino|_], Destino).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).


%----------------------------ALGORITMO DIJKSTRA-------------------------------


/**
 * Nombre: 
 * Descripcion: 
 *      
 */
dijkstra(Origen, Destino, Ruta) :-
	atravesar(Origen),                   
	rpath([Destino|RutaD], _)->         
	  reverse([Destino|RutaD], Ruta),!. 

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
ruta(Origen,Destino,Distancia):-arco(Origen,Destino,Distancia,_,_).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
distancia(Desde,Hasta,Distancia):-ruta(Desde,Hasta,Distancia).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
ruta_mas_corta([Cabeza|Ruta], Distancia) :-		       
	rpath([Cabeza|_], D), !, Distancia < D,          
	retract(rpath([Cabeza|_],_)),
	assert(rpath([Cabeza|Ruta], Distancia)).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
ruta_mas_corta(Ruta, Distancia) :-		       
	assert(rpath(Ruta,Distancia)).

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
atravesar(Desde, Ruta, Distancia) :-		   
	distancia(Desde, Hasta, D),
	not(memberchk(Hasta, Ruta)),	    
	ruta_mas_corta([Hasta,Desde|Ruta], Distancia+D),
	atravesar(Hasta,[Desde|Ruta],Distancia+D).	

/**
 * Nombre: 
 * Descripcion: 
 *      
 */
atravesar(Desde):-
    retractall(rpath(_,_)),
    atravesar(Desde,[],0).              
atravesar(_). 