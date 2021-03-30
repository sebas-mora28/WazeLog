



%---- PRONOMBRES --------------
pronombre([me|S],S).
pronombre([mi|S],S).
pronombre([yo|S],S).
pronombre([nosotros|S],S).
pronombre([nos|S],S).
pronombre([se|S], S).

%---- ARTICULOS --------------
articulo([la|S],S).
articulo([el|S],S).
articulo([al|S],S).


%---- PREPOSICIONES --------------
preposicion([en|S],S).
preposicion([para|S],S).
preposicion([hacia|S],S).
preposicion([a|S],S).

%---- VERBOS --------------
verbo([estoy|S],S).
verbo([estamos|S],S).
verbo([esta|S], S).
verbo([voy|S],S).
verbo([vamos|S],S).
verbo([dirijo|S],S).
verbo([dirigimos|S],S).
verbo([ir|S],S).
verbo([quiero|S],S).
verbo([pasar|S],S).

%---- NEGACION --------------
negacion([no|[]],[]).
negacion([no|_]).



%---- ESTABLECIMIENTO --------------
establecimiento([supermercado|_]).
establecimiento([farmacia|_]).
establecimiento([mercado|_]).
establecimiento([ferreteria|_]).
establecimiento([zapateria|_]).


arco(cartago, atenas).

/**
 * Nombre: localizacion 
 * Descripción: Llama la cláusula existe_lugar.
 */
localizacion([Lugar|[]]):- existe_lugar(Lugar).


/**
 * Nombre: existe_lugar
 * Descripción: Verifica si un lugar dado existe en la base de datos.
 */
existe_lugar(Lugar):- arco(Lugar,_); arco(_,Lugar).


/**
 * Nombre: oracion
 * Descripción: Define la estructura de las oraciones permitidas por la grámatica libre de contexto. 
 */
oracion(S0, S):- sintagma_verbal(S0, S), localizacion(S).
oracion(S0, S):- sintagma_nominal(S0, S1), sintagma_verbal(S1, S), localizacion(S).
oracion(S0, S):- sintagma_nominal(S0, S1), sintagma_verbal(S1,S2), sintagma_nominal(S2,S).
oracion(S0, S):- sintagma_verbal(S0,S1), sintagma_nominal(S1,S).
oracion(S0, S):- sintagma_nominal(S0, S).



/**
 * Nombre: sintagma_verbal
 * Descripción: Define las posibles estructuras permitidas de los signtamas verbales 
 */
sintagma_verbal(S0, S):- verbo(S0,S1), preposicion(S1,S).
sintagma_verbal(S0,S):- verbo(S0, S1), verbo(S1,S).
sintagma_verbal(S0, S):- verbo(S0,S1), verbo(S1, S2), preposicion(S2,S).


/**
 * Nombre: sintagma_nominal
 * Descripción: Define las posibles estructuras permitidas de los signtamas nominales
 */
sintagma_nominal(S0, S):- pronombre(S0,S).
sintagma_nominal(S0, S):- negacion(S0,S).
sintagma_nominal(S0,S):- articulo(S0, S), establecimiento(S).
