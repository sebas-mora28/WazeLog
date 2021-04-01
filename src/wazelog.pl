#!/usr/local/bin/swipl
:-consult(gramatica).
:-consult(rutas).


/**
 * Nombre: wazelog. 
 * Descripcion: Funcion principal, inicializa la aplicacion, llama a las cláusulas para pedir el origen, los destinos 
 *              intermedios y el destino final.
 * 
 */
wazelog:-   bienvenida,
            preguntar_origen(Origen), 
            preguntar_intermedio(Intermedios),
            preguntar_destino(Destino),
            append(Intermedios, [Destino], Lista_destinos),
            dame_ruta(Origen, Lista_destinos, Ruta),
            write("Wazelog: Su ruta sería: "), imprimir_ruta(Ruta, Distancia_total),
            write(" , Distancia estimada: "), write(Distancia_total), write(" KM"),nl,
            write("Wazelog: Muchas gracias por utilizar Wazelog, lo esperamos pronto"),nl, wazelog.


wazelog:- write("Wazelog: No existe una ruta, por favor intentelo de nuevo"),nl, wazelog.

imprimir_ruta([[Origen,Destino,Distancia]|[]], Distancia):- write(Origen), write(", "), write(Destino) .

imprimir_ruta([[Origen,_,Distancia]|Resto], Distancia_total):-  write(Origen), write(", "), 
                                                                imprimir_ruta(Resto, X), 
                                                                Distancia_total is Distancia + X.

% --------------------- Cláusulas generales ------------------------------------------------------


/**
 * Nombre: bienvenida
 * Descripcion: Imprime un mensaje de bienvenida.
 *      
 */
bienvenida:- write("Wazelog: Bienvenido a Wazelog, la mejor lógica para llegar a su destino"), nl.



/**
 * Nombre: error
 * Descripcion: Imprime un mensaje de error.
 *      
 */
error:- write("Disculpa, no te he entendido o el lugar que ingresaste no existe").



/**
 * Nombre: existe_establecimiento
 * Descripcion: Verifica si existe un establecimiento dado.
 *      
 */
existe_establecimiento(Establecimiento):- establecimiento([Establecimiento]).



/**
 * Nombre: respuesta_usuario
 * Descripcion: Verifica si la respuesta dada por el usuario cumple con las reglas establecidas en la grámatica
 *              libre de contexto.
 *      
 */
respuesta_usuario(Respuesta, Lugar):- oracion(Respuesta, [Lugar|_]).
respuesta_usuario(Respuesta):- oracion(Respuesta, _).



% ----------------- ORIGEN ------------------------------------------------------- 


/**
 * Nombre: preguntar_origen
 * Descripcion: Se encarga de pedir el lugar de origen al usario, una vez obtenido el lugar verifica que
 *              efectivamente existe dentro de la base de datos.
 */
preguntar_origen(Origen):- write("Wazelog: Por favor indique donde se encuentra"), nl,
                   write("Usuario: "),readln(Respuesta),
                   respuesta_usuario(Respuesta, Origen),
                   existe_lugar(Origen),!.

/**
 * Nombre: preguntar_origen
 * Descripcion: Se encarga de mandar un mensaje de error en caso de no recibir una oracion correcta y volver a llamar 
 *              la cláusula con el mismo nombre para volver a pedir el lugar de origen.
 */
preguntar_origen(Origen):- error, nl, preguntar_origen(Origen).

% ----------------- INTERMEDIO -----------------------------------------------------


/**
 * Nombre: preguntar_intermedio
 * Descripcion: Se encarga de preguntar si el usuario tiene algún destino intermedio y recibir su respuesta. Llama a las cláusla de
 *              su mismo nombre para verificar la respuesta. Devuelve una lista con los destinos intermedios dados por el usuario.
 *      
 */
preguntar_intermedio(Intermedios):- write("Wazelog: ¿Tiene algún destino intermedio?"),nl,
                                    write("Usuario: "), readln(Respuesta), preguntar_intermedio(Respuesta, Intermedios),!.

/**
 * Nombre: preguntar_intermedio
 * Descripcion: Se encarga de recibir la respuesta del usuario, primeramente valida que la respuesta cumpla con la gramática, verfica que 
 *              el establecimiento dado por el usuario existe. Después obtiene y verifica la respuesta del usuario a la pregunta ¿Dónde se encuentra el
*              establecimiento?. Forma una lista con todos aquellos destinos intermedios que el usuario agregó.
 *      
 */
preguntar_intermedio(Respuesta, [Lugar | Intermedios]):-  respuesta_usuario(Respuesta,Establecimiento), dif(Respuesta, no),
                                                existe_establecimiento(Establecimiento),
                                                write("Wazelog: ¿Dónde se encuentra el/la "), write(Establecimiento), write("?"),nl,
                                                write("Usuario: "), readln(Respuesta2), respuesta_usuario(Respuesta2,Lugar),
                                                existe_lugar(Lugar),
                                                write("Wazelog: Destino intermedio agregado: "), write(Lugar),nl,
                                                preguntar_intermedio(Intermedios),!.



/**
 * Nombre: preguntar_intermedio
 * Descripcion: Verifica si la respuesta a la pregunta '¿Tiene algún destino intermedio?' sea negativa, para salir del loop .
 */
preguntar_intermedio(Respuesta, []):- respuesta_usuario(Respuesta), negacion(Respuesta), !.


/**
 * Nombre: preguntar_intermedio
 * Descripcion: Se encarga de mandar un mensaje de error en caso de no recibir una oracion correcta y volver a llamar 
 *              la cláusula con el mismo nombre para volver a pedir un destino intermedio.
 */
preguntar_intermedio(_, Intermedios):- error, nl,  preguntar_intermedio(Intermedios).





%----------------------------- DESTINO ----------------------------------------------

/**
 * Nombre: preguntar_destino
 * Descripcion: Se encarga de pedir el lugar de destino al usario, una vez obtenido el lugar verifica que
 *              efectivamente existe dentro de la base de datos.
 */
preguntar_destino(Destino):- write("Wazelog: ¿Cuál es su destino?"), nl,
                    write("Usuario: "),readln(Respuesta),
                    respuesta_usuario(Respuesta, Destino),
                    existe_lugar(Destino),!.

/**
 * Nombre: preguntar_destino
 * Descripcion: Se encarga de mandar un mensaje de error en caso de no recibir una oracion correcta y volver a llamar 
 *              la cláusula con el mismo nombre para volver a pedir el lugar de destino.
 */                
preguntar_destino(Destino):- error, nl, preguntar_destino(Destino).














