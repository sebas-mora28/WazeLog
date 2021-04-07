:-dynamic rpath/2.

%Archivo:      rutas.pl
%Autor:        Emanuel Antonio Marín Gutiérrez
%
%Descripción:  Base de datos general del programa

%---------------------BASE DE CONOCIMIENTOS--------------------

%arco(CiudadOrigen, CiudadDestino, DistanciaKm, TiempoEstimado, TiempoEstimadoEnPresa).
arco(agua_caliente, corralillo, 22.0, 42, 52).
arco(agua_caliente, dulce_nombre, 1.1, 3, 13).
arco(agua_caliente, guadalupe, 5.8, 13, 23).
arco(agua_caliente, llano_grande, 13.0, 24, 34).

arco(carmen, agua_caliente, 5.3, 12, 22).
arco(carmen, corralillo, 26.0, 46, 56).
arco(carmen, dulce_nombre, 5.2, 12, 22).
arco(carmen, guadalupe, 7.2, 14, 24).
arco(carmen, llano_grande, 8.9, 15, 25).

arco(corralillo, agua_caliente, 22.0, 42, 52).
arco(corralillo, carmen, 25.0, 49, 59).
arco(corralillo, dulce_nombre, 23.0, 45, 55).
arco(corralillo, guadalupe, 19.0, 35, 45).
arco(corralillo, llano_grande, 32.0, 57, 67).

arco(dulce_nombre, agua_caliente, 1.1, 4, 14).
arco(dulce_nombre, carmen, 5.5, 15, 25).
arco(dulce_nombre, corralillo, 23.0, 44, 54).
arco(dulce_nombre, guadalupe, 6.0, 14, 24).
arco(dulce_nombre, llano_grande, 13.0, 23, 33).

arco(guadalupe, agua_caliente, 6.2, 12, 22).
arco(guadalupe, carmen, 6.4, 16, 26).
arco(guadalupe, corralillo, 19.0, 36, 46).
arco(guadalupe, dulce_nombre, 6.1, 13, 23).
arco(guadalupe, llano_grande, 13.0, 25, 35).

arco(llano_grande, agua_caliente, 13.0, 23, 33).
arco(llano_grande, carmen, 8.9, 15, 25).
arco(llano_grande, corralillo, 33.0, 56, 66).
arco(llano_grande, dulce_nombre, 13.0, 23, 33).
arco(llano_grande, guadalupe, 14.0, 23, 33).


arco(cartago, heredia, 13.0, 23, 33).
arco(cartago, heredia, 5.0, 23, 33).
arco(heredia, puntarenas, 20.0, 23, 33).
arco(heredia, alajuela, 2.0, 23, 33).
arco(alajuela, heredia, 15.0, 23, 33).
arco(alajuela, cartago, 8.0, 23, 33).
arco(limon, guanacaste, 250.0, 23, 33).
arco(limon, puntarenas, 35.0, 23, 33).
arco(san_jose, cartago, 2.0, 23, 33).
arco(puntarenas, alajuela, 13.0, 23, 33).
arco(puntarenas, limon, 13.0, 23, 33).

%----------------------------REGLAS-------------------------------


/**
 * Nombre: dame_origen
 * Descripción: Devuelve la ciudad de origen del arco o arista que es pasado 
 *              como argumento.
 *      
 */
dame_origen(Arco, CiudadOrigen)  :- arg(1, Arco, CiudadOrigen).

/**
 * Nombre: dame_destino
 * Descripción: Devueve la ciudad de destino del arco o arista que es pasado
 *              como argumento.
 *      
 */
dame_destino(Arco, CiudadDestino):- arg(2, Arco, CiudadDestino).

/**
 * Nombre: dame_distancia
 * Descripción: Devuelve la distancia en km que existe entre una ciudad de origen
 *              y una de destino, según el arco o arista pasado como argumento.
 *      
 */
dame_distancia(Arco, DistanciaKm):- arg(3, Arco, DistanciaKm).

/**
 * Nombre: dame_tiempo
 * Descripción: Devuelve el tiempo estimado en minutos que se tarda en ir de una 
 *              ciudad a otra, según el arco o arista pasado como argumento.
 *      
 */
dame_tiempo(Arco, TiempoEstimado):- arg(4, Arco, TiempoEstimado).

/**
 * Nombre: dame_tiempo_presa
 * Descripción: Devuelve el tiempo, considerando presas o algún otro altercado vial,
 *              en minutos que se tarda en ir de una ciudad a otra, según el arco o 
 *              arista pasado como argumento.
 *              
 *      
 */
dame_tiempo_presa(Arco, TiempoEstimadoEnPresa):- arg(5, Arco, TiempoEstimadoEnPresa).

/**
 * Nombre: dame_lista_origen
 * Descripción: De acuerdo a una ciudad de destino, se devuelve una lista con todas 
 *              las ciudades de origen que están conectadas directamente a esta.
 *      
 */
dame_lista_origen(Destino, ListaOrigen)  :- findall(Origen,  arco(Origen, Destino,_,_,_), ListaOrigen).

/**
 * Nombre: dame_lista_destino
 * Descripción: De acuerdo a una ciudad de origen, se devuelve una lista con todas 
 *              las ciudades que están directamente conectadas a esta.
 *      
 */
dame_lista_destino(Origen, ListaDestino) :- findall(Destino, arco(Origen, Destino,_,_,_), ListaDestino).

/**
 * Nombre: dame_tiempos
 * Descripción: Devuelve el tiempo estimado y el tiempo estimado en presa que se 
 *              tarde en ir de una ciudad a otra.
 *      
 */
dame_tiempos(Origen, Destino, Tiempos)   :- arco(Origen, Destino,_,T1,T2), Tiempos = [T1,T2].

/**
 * Nombre: existe_lugar
 * Descripción: Verifica si un lugar existe o no en la base de conocimientos.
 *      
 */
existe_lugar(Lugar):- arco(Lugar,_,_,_,_), !; arco(_,Lugar,_,_,_), !.

/**
 * Nombre: dame_ruta
 * Descripción: Devuelve una lista con sublistas indicando todo el trayecto y las 
 *              distancias recorridas desde una ciudad de origen y otra de destino, 
 *              sin considerar ciudades intermedias.
 *      
 */
dame_ruta(Origen, Destinos, Lista_Respuesta):-
    length(Destinos, Longitud), 
    Longitud == 1,
    dame_nodo(Destinos, Destino),
    dijkstra(Origen, Destino, [_|Ruta]),
    ruta_directa(Origen, Ruta, Lista_Respuesta), !.

/**
 * Nombre: dame_ruta
 * Descripción: Devuelve una lista con sublistas indicando todo el trayecto y las
 *              distancias recorridas entre una ciudad de origen y otra de destino,
 *              pasando por ciudades intermedio.
 *      
 */
dame_ruta(Origen, Destinos, Lista_Respuesta):-
    length(Destinos, Longitud),
    Longitud > 1,
    dame_ruta_aux(Origen, Destinos, Lista_Respuesta).

/**
 * Nombre: dame_ruta_aux
 * Descripción: Condición de finalización para el caso en que la ruta total considera
 *              ciudades intermedias.
 *      
 */
dame_ruta_aux(_, [], Lista_Respuesta):- Lista_Respuesta = [], !.

/**
 * Nombre: dame_ruta_aux
 * Descripción: Se encarga de devolver la lista con sublistas de la trayectoria total
 *              con ciudades intermedias.
 *      
 */
dame_ruta_aux(Origen, [Destino|Destinos], Lista_Respuesta):-
    dijkstra(Origen, Destino, [_|Ruta]),
    ruta_directa(Origen, Ruta, Lista_Inicial),
    dame_ruta_aux(Destino, Destinos, Lista_Final),
    concatenar(Lista_Inicial, Lista_Final, Lista_Respuesta).

/**
 * Nombre: ruta_directa
 * Descripción: Condición de finalización de la estructura de datos formada por una
 *              lista con sublistas de la trayectoria total entre una ciudad de origen
 *              y una de destino, considerando ciudades intermedias.
 *      
 */
ruta_directa(_, [], Lista_Respuesta):- Lista_Respuesta = [], !.

/**
 * Nombre: ruta_directa
 * Descripción: Se encarga de formar la estructuta de datos formada por una lista
 *              con sublistas de la trayectoria total entre una ciudad de origen
 *              y una de destino, considerando ciudades intermedias.
 *      
 */
ruta_directa(Origen, [Destino|Ruta], Lista_Respuesta):-
    ruta_directa_aux(Origen, Destino, Lista_Inicial),
    ruta_directa(Destino, Ruta, Lista_Final),
    concatenar(Lista_Inicial, Lista_Final, Lista_Respuesta).

/**
 * Nombre: ruta_diirecta_aux
 * Descripción: Devuelve una sublista con la ciudad de origen, la ciudad de destino
 *              y la distancia entre ambas de un arco o arista en particular.
 *      
 */
ruta_directa_aux(Origen, Destino, Ruta):-
    arco(Origen, Destino, Distancia, Tiempo, TiempoPresa),
    Lista = [Origen, Destino, Distancia, Tiempo, TiempoPresa],
    Ruta = [Lista].

/**
 * Nombre: dame_nodo
 * Descripción: Devuelve la cabeza de una lista.
 *      
 */
dame_nodo([Destino|_], Destino).

/**
 * Nombre: concatenar
 * Descripción: Concatena dos listas.
 *      
 */
concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):- concatenar(L1,L2,L3).


%----------------------------ALGORITMO DIJKSTRA-------------------------------


/**
 * Nombre: dijkstra
 * Descripción: Devuelve la ruta más corta entre dos nodos de un grafo.
 *      
 */
dijkstra(Origen, Destino, Ruta) :-
	atravesar(Origen),                   
	rpath([Destino|RutaD], _)->         
	  reverse([Destino|RutaD], Ruta),!. 

/**
 * Nombre: ruta
 * Descripción: Verifica que exista al menos una ruta en la base de conocimientos
 *              para poder determinar la más corta en término de distancia.
 *      
 */
ruta(Origen,Destino,Distancia):-arco(Origen,Destino,Distancia,_,_).

/**
 * Nombre: distancia
 * Descripción: Devuelve la distancia existente entre una ciudad de origen y otra
 *              de destino conectadas directamente.
 *      
 */
distancia(Desde,Hasta,Distancia):-ruta(Desde,Hasta,Distancia).

/**
 * Nombre: ruta_mas_corta
 * Descripción: Devuelve la ruta más corta comenzando, analizando cada uno de los 
 *              nodos que conforman la ruta.
 *      
 */
ruta_mas_corta([Cabeza|Ruta], Distancia) :-		       
	rpath([Cabeza|_], D), !, Distancia < D,          
	retract(rpath([Cabeza|_],_)),
	assert(rpath([Cabeza|Ruta], Distancia)).

/**
 * Nombre: ruta_mas_corta
 * Descripción: Almacena la ruta y la distancia para luego ser evaluada.
 *      
 */
ruta_mas_corta(Ruta, Distancia) :-		       
	assert(rpath(Ruta,Distancia)).

/**
 * Nombre: atravesar
 * Descripción: Atraviesa todos los nodos que son accesibles.
 *      
 */
atravesar(Desde, Ruta, Distancia) :-		   
	distancia(Desde, Hasta, D),
	not(memberchk(Hasta, Ruta)),	    
	ruta_mas_corta([Hasta,Desde|Ruta], Distancia+D),
	atravesar(Hasta,[Desde|Ruta],Distancia+D).	

/**
 * Nombre: atravesar
 * Descripción: Atraviesa todos los nodos que son accesibles.
 *      
 */
atravesar(Desde):-
    retractall(rpath(_,_)),
    atravesar(Desde,[],0).              
atravesar(_). 