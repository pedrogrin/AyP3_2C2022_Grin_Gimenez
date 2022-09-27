# Preguntas

## Abstracción de los tests 01 y 02 

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

Nosotros utilizamos un mensaje ya implementado en Smalltalk(should:notTakeMoreThan:) que sería una especie de cronometro o temporizador, que contabiliza los tiempos de cada acción y se fija en si logra cumplir el tiempo pedido.
En la realidad yo puedo tener un celular, y contabilizar el tiempo en que tardo en hacer algo, y a su vez, simplemente modificando el tiempo del temporizador puedo ver cuanto tardo en hacer otra cosa, al igual que el código que utilizamos.

## Cómo representar en Smalltalk

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

Podemos usar mensajes, objetos, clousures, clases, instancias de clases. A su vez, estos entes los puedo guardar en colaboradores, ya sean temporales, internos o externos.
También estaría bueno aclarar que hay entes de la realidad ya modelados en SmallTalk, sean clases, mensajes u otros objetos, de los que podemos (y debemos) hacer uso si buscamos representar el mismo ente de la realidad.

## Teoría de Naur

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

Al crear abstracciones estas son propias del programador, el que las pensó sabe porque lo hizo, que ganancia tenía crearlas y cómo las creó. Además, al uno crear abstracciones puede justificar cualquier pregunta que se le realicen sobre ellas, consiguiendo explicar lo antes mencionado.
Es decir, uno forma la teoría de como resuelve el problema usando sus propios pensamientos, que resultan en modelos en el que pueden haber abstracciones que se le ocurrió al mismo programando, y que pueden diferir a abstracciones pensadas por otros.

