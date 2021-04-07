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
            write("Wazelog: Su ruta sería: "), imprimir_ruta(Ruta, Distancia_total, Tiempo_estimado_total, Tiempo_estimado_en_presa_total),
            write(" , Distancia estimada: "), write(Distancia_total), write(" KM"),
            write(" , Tiempo estimado: "), write(Tiempo_estimado_total), write(" min"),
            write(" , Tiempo en presa estimado: "), write(Tiempo_estimado_en_presa_total), write(" min"), nl,  
            write("Wazelog: Muchas gracias por utilizar Wazelog, lo esperamos pronto"),nl, wazelog.




/**
 *  Nombre: wazelog
 *  Descripción: Cláusula que se ejecuta cuando no existe la ruta entre los lugares dados por el usuario. 
 *               Vuelve a llamar la cláusula con su mismo nombre para volver a comenzar.
 */
wazelog:- write("Wazelog: No existe una ruta, por favor intentelo de nuevo"),nl, wazelog.



/**
 *  Nombre: imprimir_ruta
 *  Descripción: Punto de parada, se ejecuta cuando se llega al último elemento de la lista de ruta. Imprime
 *               el origen y destino del último elemento de la lista. 
 * imprimir_ruta([[Origen,_,Distancia, Tiempo_estimado, Tiempo_estimado_en_presa]|Resto], Distancia_total,Tiempo_estimado_total, Tiempo_estimado_en_presa_total) 
 *      --> Origen: Nombre del lugar de origen del primer arco contenido en la lista actual.
 *      --> Distancia: Distancia del primer arco contenido en la lista actual.
 *      --> Tiempo_estimado: Tiempo estimado del primer arco contenido en la lista actual.
 *      --> Tiempo_estimado_en_presa : Tiempo estimado en presa del primer arco contenido en la lista actual. 
 */
imprimir_ruta([[Origen,Destino,Distancia, Tiempo_estimado, Tiempo_estimado_en_presa]|[]], Distancia, Tiempo_estimado,Tiempo_estimado_en_presa):- 
                                                                write(Origen), write(", "), write(Destino) .


/**
 *  Nombre: imprimir_ruta
 *  Descripción: Recorre la lista de ruta e imprime el lugar de origen del arco actual. Además devuelve 
 *               la distancia total de la ruta dada. 
 * 
 * imprimir_ruta([[Origen,_,Distancia, Tiempo_estimado, Tiempo_estimado_en_presa]|Resto], Distancia_total,Tiempo_estimado_total, Tiempo_estimado_en_presa_total) 
 *      --> Origen: Nombre del lugar de origen del primer arco contenido en la lista actual.
 *      --> Distancia: Distancia del primer arco contenido en la lista actual.
 *      --> Tiempo_estimado: Tiempo estimado del primer arco contenido en la lista actual.
 *      --> Tiempo_estimado_en_presa : Tiempo estimado en presa del primer arco contenido en la lista actual.
 *      --> Resto: Cola de lista con la ruta 
 *      --> Distancia_total: Variable que lleva la suma de las distancias de cada arco contenido en la lista de la ruta. 
 *      --> Tiempo_estimadoTotal: Variable que lleva la suma del tiempo estimado de cada arco contenido en la lista de la ruta. 
 *      --> Tiempo_estimado_en_presaTotal : Variable que lleva la suma del tiempo estimado en presa de cada arco contenido en la lista de la ruta. 
 *                                                                          
 */
imprimir_ruta([[Origen,_,Distancia, Tiempo_estimado, Tiempo_estimado_en_presa]|Resto], DistanciaTotal,Tiempo_estimadoTotal, Tiempo_estimado_en_presaTotal):-  
                                                                write(Origen), write(", "), 
                                                                imprimir_ruta(Resto, X, Y, Z), 
                                                                DistanciaTotal is Distancia + X,
                                                                Tiempo_estimadoTotal is Tiempo_estimado + Y,
                                                                Tiempo_estimado_en_presaTotal is Tiempo_estimado_en_presa + Z.

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
 * existe_establecimiento(Establecimiento) --> Establecimiento: Nombre del establecimiento a verificar si existe. 
 *      
 */
existe_establecimiento(Establecimiento):- establecimiento([Establecimiento]).



/**
 * Nombre: respuesta_usuario
 * Descripcion: Verifica si la respuesta dada por el usuario cumple con las reglas establecidas en la grámatica
 *              libre de contexto. Devuelve el lugar que incluye la oración. 
 * 
 * respuesta_usuario(Respuesta, Lugar) --> Respuesta: Lista con la respuesta dada por el usuario. Es obtenida del readln.
 *                                     --> Lugar: Lugar incluido en la oración dada por el usuario.
 *      
 */
respuesta_usuario(Respuesta, Lugar):- oracion(Respuesta, [Lugar|_]).
respuesta_usuario(Respuesta):- oracion(Respuesta, _).



% ----------------- ORIGEN ------------------------------------------------------- 


/**
 * Nombre: preguntar_origen
 * Descripcion: Se encarga de pedir el lugar de origen al usario, una vez obtenido el lugar verifica que
 *              efectivamente existe dentro de la base de datos.
 * 
 * preguntar_origen(Origen) --> Origen: Nombre del lugar de origen dado por el usuario.
 */
preguntar_origen(Origen):- write("Wazelog: Por favor indique donde se encuentra"), nl,
                   write("Usuario: "), readln(Respuesta),
                   respuesta_usuario(Respuesta, Origen),
                   existe_lugar(Origen),!.

/**
 * Nombre: preguntar_origen
 * Descripcion: Se encarga de mandar un mensaje de error en caso de no recibir una oracion correcta y volver a llamar 
 *              la cláusula con el mismo nombre para volver a pedir el lugar de origen.
 *
 * preguntar_origen(Origen) --> Origen: Nombre del lugar de origen dado por el usuario.
 */
preguntar_origen(Origen):- error, nl, preguntar_origen(Origen).

% ----------------- INTERMEDIO -----------------------------------------------------


/**
 * Nombre: preguntar_intermedio
 * Descripcion: Se encarga de preguntar si el usuario tiene algún destino intermedio y recibir su respuesta. Llama a las cláusla de
 *              su mismo nombre para verificar la respuesta. Devuelve una lista con los destinos intermedios dados por el usuario.
 *
 * preguntar_intermedio(Intermedios) --> Intermedios: Lista con los lugares intermedios dado por el usuario. 
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
 * preguntar_intermedio(Resuesta, [Destino_intermedio| Intermedios])  --> Respuesta: Lista con la respuesta dada por el usuario.
 *                                                                    --> Destino_intermedio: Destino intermedio dado por el usuario
 *                                                                    --> Intermedios          
 *      
 */
preguntar_intermedio(Respuesta, [Destino_intermedio | Intermedios]):-   respuesta_usuario(Respuesta,Establecimiento), dif(Respuesta, no),
                                                                        existe_establecimiento(Establecimiento),
                                                                        write("Wazelog: ¿Dónde se encuentra el/la "), write(Establecimiento), write("?"),nl,
                                                                        write("Usuario: "), readln(Respuesta2), respuesta_usuario(Respuesta2,Destino_intermedio),
                                                                        existe_lugar(Destino_intermedio),
                                                                        write("Wazelog: Destino intermedio agregado: "), write(Destino_intermedio),nl,
                                                                        preguntar_intermedio(Intermedios),!.



/**
 * Nombre: preguntar_intermedio
 * Descripcion: Verifica si la respuesta a la pregunta '¿Tiene algún destino intermedio?' sea negativa, para salir del loop .
 * 
 * preguntar_intermedio(Respuesta, []) --> Respuesta: Lista con la respuesta dada por el usuario. 
 *                                     --> [] --> Devuelve una lista vacía para terminar de formar la lista con destinos intermedios. 
 */
preguntar_intermedio(Respuesta, []):- respuesta_usuario(Respuesta), negacion(Respuesta), !.


/**
 * Nombre: preguntar_intermedio
 * Descripcion: Se encarga de mandar un mensaje de error en caso de no recibir una oracion correcta y volver a llamar 
 *              la cláusula con el mismo nombre para volver a pedir un destino intermedio.
 *
 * 
 * preguntar_intermdio(_, Intermedios) --> Intermedios: Lista con los destinos intermedios dados por el usuario. 
 */
preguntar_intermedio(_, Intermedios):- error, nl,  preguntar_intermedio(Intermedios).



%----------------------------- DESTINO ----------------------------------------------

/**
 * Nombre: preguntar_destino
 * Descripcion: Se encarga de pedir el lugar de destino al usario, una vez obtenido el lugar verifica que
 *              efectivamente existe dentro de la base de datos.
 *
 * preguntar_destino(Destino) --> Destino: Nombre del lugar de destino dado por el usuario
 */
preguntar_destino(Destino):- write("Wazelog: ¿Cuál es su destino?"), nl,
                    write("Usuario: "),readln(Respuesta),
                    respuesta_usuario(Respuesta, Destino),
                    existe_lugar(Destino),!.

/**
 * Nombre: preguntar_destino
 * Descripcion: Se encarga de mandar un mensaje de error en caso de no recibir una oracion correcta y volver a llamar 
 *              la cláusula con el mismo nombre para volver a pedir el lugar de destino.
 *
 * preguntar_destino(Destino) --> Destino: Nombre del lugar de destino dado por el usuario
 */                
preguntar_destino(Destino):- error, nl, preguntar_destino(Destino).














