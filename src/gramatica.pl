:-consult(rutas).


%---- PRONOMBRES --------------

/**
 * Nombre: pronombre
 * 
 * Descripción: Hechos que contienen todos los pronombres permitidos en la gramática libre de contexto.
 *
 * pronombre([pronombre|S], S) --> pronombre: pronombre permitido.
 *                             --> S: resto de la oración.
*/

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


pronombre_reflexivo([se|S], S).
pronombre_relativo([que|S], S).


%---- ARTICULOS --------------
articulo([la|S],S).
articulo([el|S],S).
articulo([al|S],S).



%---- PREPOSICIONES --------------
/**
 * Nombre: preposicion
 * 
 * Descripción: Hechos que contienen todos las preposiciones permitidos en la gramática libre de contexto.
 *
 * pronombre([preposicion|S], S) --> preposicion: preposicion permitido.
 *                               --> S: resto de la oración.
*/

preposicion([en|S],S).
preposicion([para|S],S).
preposicion([hacia|S],S).
preposicion([a|S],S).

%---- VERBOS --------------

/**
 * Nombre: verbo
 * 
 * Descripción: Hechos que contienen todos los verbos permitidos en la gramática libre de contexto.
 *
 * pronombre([verbo|S], S)     --> verbo: verbo permitido.
 *                             --> S: resto de la oración.
*/

verbo([estoy|S],S).
verbo([estamos|S],S).
verbo([esta|S], S).
verbo([voy|S],S).
verbo([va|S],S).
verbo([van|S], S).
verbo([vamos|S],S).
verbo([dirijo|S],S).
verbo([dirijen|S],S).
verbo([dirijimos|S],S).
verbo([ir|S],S).
verbo([quiero|S],S).
verbo([pasar|S],S).
verbo([ubicado|S], S).
verbo([ubicados|S], S).
verbo([ubica|S], S).
verbo([ubico|S], S).
verbo([ubican|S], S).
verbo([encuentra|S], S).
verbo([tengo|S], S).


%---- NEGACION --------------

/**
 * Nombre: negacion
 * 
 * Descripción: Hechos que contienen todos las negaciones permitidas en la gramática libre de contexto.
 *
 * pronombre([negacion|S], S)  --> negacion: pronombre permitido.
 *                             --> S: resto de la oración.
*/

negacion([no|[]],[]).
negacion([no|_]).



%---- ESTABLECIMIENTO --------------

/**
 * Nombre: establecimiento
 * 
 * Descripción: Hechos que contienen todos los establecimientos permitidos en la gramática libre de contexto.
 *
 * pronombre([establecimiento|S], S) --> establecimiento: establecimiento permitido.
 *                             --> S: resto de la oración.
*/

establecimiento([supermercado|_]).
establecimiento([farmacia|_]).
establecimiento([mercado|_]).
establecimiento([ferreteria|_]).
establecimiento([zapateria|_]).
establecimiento([carniceria|_]).
establecimiento([fruteria|_]).
establecimiento([mall|_]).
establecimiento([tienda|_]).
establecimiento([restaurante|_]).



/**
 * Nombre: localizacion 
 * Descripción: Llama la cláusula existe_lugar.
 * 
 * localizacion([Lugar|[]]) --> Lugar: Nombre del lugar que se desea verificar si existe. 
 */
localizacion([Lugar|[]]):- existe_lugar(Lugar).


/**
 * Nombre: existe_lugar
 * Descripción: Verifica si un lugar dado existe en la base de datos.
 */



/**
 * Nombre: oracion
 * Descripción: Define la estructura de las oraciones permitidas por la grámatica libre de contexto. 
 * 
 * oracion(Oracion, S) --> Oracion: Lista con la respuesta dada por el usuario.
 *                     --> S: Nombre del lugar o establecimiento.                         
 */
oracion(Oracion, S):- sintagma_verbal(Oracion, S), localizacion(S).
oracion(Oracion, S):- sintagma_nominal(Oracion, Oracion1), sintagma_verbal(Oracion1, S), localizacion(S).
oracion(Oracion, S):- sintagma_nominal(Oracion, Oracion1), sintagma_verbal(Oracion1,Oracion2), sintagma_nominal(Oracion2,S).
oracion(Oracion, S):- sintagma_verbal(Oracion,Oracion1), sintagma_nominal(Oracion1,S).
oracion(Oracion, S):- sintagma_nominal(Oracion, S).



/**
 * Nombre: sintagma_verbal
 * Descripción: Define las posibles estructuras permitidas de los signtamas verbales
 * 
 * sintagma_verbal(Oracion, S) --> Oracion: Lista con la respuesta dada por el usuario.
 *                            --> S:. 
 */
sintagma_verbal(Oracion, S):- verbo(Oracion,Oracion1), preposicion(Oracion1,S).
sintagma_verbal(Oracion, S):- verbo(Oracion,Oracion1), pronombre_relativo(Oracion1, Oracion2), verbo(Oracion2, Oracion3), preposicion(Oracion3,S).
sintagma_verbal(Oracion, S):- verbo(Oracion,Oracion1), pronombre_relativo(Oracion1, Oracion2), verbo(Oracion2, S).
sintagma_verbal(Oracion,S):- verbo(Oracion, Oracion1), verbo(Oracion1,S).
sintagma_verbal(Oracion,S):- verbo(Oracion, S).
sintagma_verbal(Oracion, S):- verbo(Oracion,Oracion1), verbo(Oracion1, Oracion2), preposicion(Oracion2,S).


/**
 * Nombre: sintagma_nominal
 * Descripción: Define las posibles estructuras permitidas de los signtamas nominales.
 *
 * sintagma_nominal(Oracion, S) --> Oracion: Lista con la respuesta dada por el usuario.
 *                             --> S: Nombre del lugar o establecimiento. 
 */
sintagma_nominal(Oracion, S):- pronombre(Oracion,S).
sintagma_nominal(Oracion, S):- pronombre(Oracion,Oracion1), pronombre_reflexivo(Oracion1, S).
sintagma_nominal(Oracion, S):- negacion(Oracion,S).
sintagma_nominal(Oracion,S):- articulo(Oracion, S), establecimiento(S).
