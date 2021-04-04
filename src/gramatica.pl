:-consult(rutas).


%---- PRONOMBRES --------------
pronombre([me|S],S).
pronombre([mi|S],S).
pronombre([yo|S],S).
pronombre([nosotros|S],S).
pronombre([nos|S],S).
pronombre([se|S], S).
pronombre([ellos|S],S).
pronombre([ellas|S],S).
pronombre([el|S],S).
pronombre([ella|S],S).


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
verbo([va|S],S).
verbo([van]|S), S.
verbo([vamos|S],S).
verbo([dirijo|S],S).
verbo([dirigimos|S],S).
verbo([ir|S],S).
verbo([quiero|S],S).
verbo([pasar|S],S).
verbo([ubicado|S], S).
verbo([ubica|S], S).
verbo([ubico|S], S).
verbo([encuentra|S], S).
%---- NEGACION --------------
negacion([no|[]],[]).
negacion([no|_]).



%---- ESTABLECIMIENTO --------------
establecimiento([supermercado|_]).
establecimiento([farmacia|_]).
establecimiento([mercado|_]).
establecimiento([ferreteria|_]).
establecimiento([zapateria|_]).


/**
 * Nombre: localizacion 
 * Descripción: Llama la cláusula existe_lugar.
 */
localizacion([Lugar|[]]):- existe_lugar(Lugar).


/**
 * Nombre: existe_lugar
 * Descripción: Verifica si un lugar dado existe en la base de datos.
 */



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
