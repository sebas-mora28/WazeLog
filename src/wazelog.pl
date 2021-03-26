




pronombre([me|S],S).
pronombre([mi|S],S).
pronombre([yo|S],S).
pronombre([nosotros|S],S).
pronombre([nos|S],S).


articulo([la|S],S).
articulo([el|S],S).
articulo([al|S],S).

preposicion([en|S],S).
preposicion([para|S],S).
preposicion([hacia|S],S).
preposicion([a|S],S).


verbo([estoy|S],S).
verbo([estamos|S],S).
verbo([voy|S],S).
verbo([vamos|S],S).
verbo([dirijo|S],S).
verbo([dirigimos|S],S).
verbo([ir|S],S).
verbo([quiero|S],S).
verbo([pasar|S],S).


establecimiento([supermercado|S],S).
establecimiento([farmacia|S],S).
establecimiento([mercado|S],S).
establecimiento([ferreteria|S],S).
establecimiento([zapateria|S],S).




localizacion(S,S).
localizacion(S):- localizacion(S,S).

oracion(S):- oracion(S, []).
oracion(S0, S):- sintagma_verbal(S0, S).
oracion(S0, S):- sintagma_nominal(S0, S1), sintagma_verbal(S1, S).
oracion(S0, S):- sintagma_nominal(S0, S1), sintagma_verbal(S1,S2), sintagma_nominal(S2,S).
oracion(S0, S):- sintagma_verbal(S0,S1), sintagma_nominal(S1,S).

sintagma_verbal(S0, S):- verbo(S0,S1), preposicion(S1,S).
sintagma_verbal(S0, S):- verbo(S0,S1), verbo(S1, S2), preposicion(S2,S).
sintagma_nominal(S0, S):- pronombre(S0,S).
sintagma_nominal(S0,S):- articulo(S0, S1), establecimiento(S1, S).


wazelog:- bienvenida,
          repeat, 
            preguntar_origen,
            preguntar_destino.
        

preguntar_origen:- write("Wazelog: Por favor indiqueme donde se encuentra"), nl,
                   write("Usuario: "),readln(X),
                   oracion(X), !.

preguntar_origen:- write("Wazelog: Disculpe no te he entendido"), nl, preguntar_origen.


preguntar_destino:- write("Wazelog: Muy bien,¿ Cuál es su destino?"), nl,
                    write("Usuario: "), readln(X),
                    oracion(X), !.

preguntar_destino:- write("Wazelog: Lo siento, no te he entendido"), nl, preguntar_destino.


bienvenida:- write("Wazelog : Bienvenido a Wazelog, la mejor lógica para llegar a su destino"), nl.
