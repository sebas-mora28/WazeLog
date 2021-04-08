:-dynamic rpath/2.

%Archivo:      rutas.pl
%Autor:        Emanuel Antonio Marín Gutiérrez
%
%Descripción:  Base de datos general del programa

%---------------------BASE DE CONOCIMIENTOS--------------------

%arco(CiudadOrigen, CiudadDestino, DistanciaKm, TiempoEstimado, TiempoEstimadoEnPresa).



arco(san_jose, corralillo, 22.0, 22, 44).
arco(san_jose, cartago, 20, 20, 40).
arco(corralillo, san_jose, 22.0, 42, 52).
arco(corralillo, musgo_verde, 6.0, 6, 12).
arco(musgo_verde, cartago, 10.0, 10, 20).
arco(musgo_verde, corralillo, 6.0, 12, 24).
arco(cartago, musgo_verde, 10.0, 20, 40).
arco(cartago, san_jose, 20.0, 20, 40).
arco(cartago, tres_rios, 8.0, 8, 16).
arco(cartago, paraiso, 10.0, 10, 20).
arco(cartago, pacayas, 13.0, 13, 26).
arco(tres_rios, san_jose, 8.0, 8, 16).
arco(tres_rios, pacayas, 15.0, 15, 30).
arco(pacayas, tres_rios, 15.0, 15, 30).
arco(pacayas, cartago, 13.0, 13, 26).
arco(pacayas, cervantes, 8.0, 8, 16).
arco(paraiso, cervantes, 4.0, 4, 8).
arco(paraiso, orosi, 8.0, 8, 16).
arco(paraiso, cachi, 10.0, 10, 20).
arco(cervantes, pacayas, 8.0, 8, 16).
arco(cervantes, juan_vinas, 5.0, 5, 10).
arco(cervantes, cachi, 7.0, 7, 14).
arco(juan_vinas, turrialba , 4.0, 4, 8).
arco(turrialba, pacayas, 18.0, 18, 36).
arco(turrialba, cachi, 40, 40, 80).
arco(cachi, cervantes, 7.0, 7, 14).
arco(cachi, paraiso, 10.0, 10, 20).
arco(cachi, orosi, 12.0, 12, 24).
arco(cachi, turrialba, 40.0, 40, 80).
arco(orosi, paraiso, 8.0, 8, 16).
arco(orosi, cachi, 12.0, 12, 24).



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