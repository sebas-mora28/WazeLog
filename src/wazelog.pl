#!/usr/local/bin/swipl
:-consult(gramatica).

wazelog:- bienvenida,
          repeat, 
            preguntar_origen(Origen),
            preguntar_intermedio(Intermedios),
            preguntar_destino(Destino), write(Intermedios), write(Origen), write(Destino).
        

% --------------------- Clausulas generales ------------------------------------------------------

bienvenida:- write("Wazelog: Bienvenido a Wazelog, la mejor lógica para llegar a su destino"), nl.

error:- write("Disculpa, no te he entendido o el lugar que ingresaste no existe").

existe_lugar(Lugar):- arco(Lugar,_); arco(_,Lugar).
existe_lugar(_):- write("El lugar que ingresaste no existe"),!,fail.
existe_establecimiento(Establecimiento):- establecimiento([Establecimiento]).


respuesta_usuario(Respuesta, Lugar):- oracion(Respuesta, [Lugar|_]).
respuesta_usuario(Respuesta):- oracion(Respuesta, _).

% ----------------- ORIGEN ------------------------------------------------------- 

preguntar_origen(Origen):- write("Wazelog: Por favor indique donde se encuentra"), nl,
                   write("Usuario: "),readln(Respuesta),
                   respuesta_usuario(Respuesta, Origen),
                   existe_lugar(Origen),!.


preguntar_origen(Origen):- error, nl, preguntar_origen(Origen).



% ----------------- INTERMEDIO -----------------------------------------------------

preguntar_intermedio(Intermedios):- write("Wazelog: ¿Tiene algún destino intermedio?"),nl,
                                    write("Usuario: "), readln(Respuesta), preguntar_intermedio(Respuesta, Intermedios).


preguntar_intermedio(Respuesta, [Lugar | Intermedios]):-  respuesta_usuario(Respuesta,Establecimiento), dif(Respuesta, no),
                                                existe_establecimiento(Establecimiento),
                                                write("Wazelog: ¿Dónde se encuentra el/la "), write(Establecimiento), write("?"),nl,
                                                write("Usuario: "), readln(Respuesta2), respuesta_usuario(Respuesta2,Lugar),
                                                existe_lugar(Lugar),
                                                write("Wazelog: Destino intermedio agregado"),nl,
                                                preguntar_intermedio(Intermedios).


preguntar_intermedio(Respuesta, []):- respuesta_usuario(Respuesta), negacion(Respuesta), !.


preguntar_intermedio(_, Intermedios):- error, nl,  preguntar_intermedio(Intermedios).

%----------------------------- DESTINO ----------------------------------------------

preguntar_destino(Destino):- write("Wazelog: ¿Cuál es su destino?"), nl,
                    write("Usuario: "),readln(Respuesta),
                    respuesta_usuario(Respuesta, Destino).


preguntar_destino(Destino):- error, nl, preguntar_destino(Destino).














