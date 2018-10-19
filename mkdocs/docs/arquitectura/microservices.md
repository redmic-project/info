# Microservicios
## ¿Qué es?
Microservicios es una arquitectura de desarrollo de software donde las aplicaciones se dividen en componentes más pequeños e independientes entre sí. A diferencia de un enfoque tradicional “monolítico”, en el que todo se crea en un único componente, los microservicios están separados y funcionan conjuntamente para llevar a cabo las mismas tareas.

### Beneficios
* Agilizan la implementación y actualización de los componentes.
* Alta disponibilidad. A medida que crece la demanda de ciertos servicios, puede desplegarse en múltiples servidores e infraestructuras para satisfacer las necesidades, aumentando la escalabilidad.
* Tolerancia a fallos. Estos servicios no se afectan entre sí, lo que significa que si un microservicio falla, la aplicación completa no cae, a diferencia del modelo de aplicación monolítica.
* Más fácil de implementar.
* Más fácil de comprender, actualizar y mejorar.
* Permite elegir el mejor lenguaje y tecnología para cada microservicio.

### Desafíos
* Requiere un cambio de mentalidad.
* Se debe dedicar tiempo a identificar las dependencias entre los servicios.
* Los tests pueden ser más difíciles a la vez que imprescindibles.
* El manejo de versiones para garantizar la compatibilidad entre microservicios es muy importante.
* Despliegue automático para facilitar la implementación, ya que a medida que crece el número de microservicios, se hace insostenible un despliegue manual.
* Logs centralizados.
* Monitorización de los sistemas, para identificar fuentes de problemas.
* Necesidad de usar descubrimiento de servicios, ya sea centralizado o integrado. De esta manera se puede acceder a proveedores de servicio con ubicaciones de red dinámicas.

### ¿Por qué usar microservicios?
REDMIC es un repositorio que aspira a integrar gran cantidad de datos provenientes de actividades muy diferentes entre sí y que muchas veces no tienen una relación directa o dependencia. Implementar todas estas funcionalidades en una aplicación monolítica, convertiría al repositorio en una plataforma pesada y difícil de mantener por lo que el uso de una arquitectura de microservicios es prácticamente una obligación.

Sin embargo, este enfoque requiere tener en cuenta multitud de factores, como la comunicación asíncrona entre microservicios, control de errores más exhaustivo, etc. Para ello se hace uso de una serie de patrones de diseño que se comentan a continuación.

La comunicación eficiente entre servicios, incluso entre piezas de una misma unidad funcional, se torna imprescindible. Para ello la solución más usada es la utilización de un broker que permita la comunicación asíncrona entre componentes. Entre los broker más conocidos se encuentra Kafka, que va mucho más allá, permitiendo realizar operaciones de streaming y recuperación de datos, convirtiéndose en la solución perfecta para la implementación de **Event Sourcing** + **CQRS** como se verá a continuación.

## Event Sourcing y CQRS

Event sourcing es un patrón de desarrollo de aplicaciones que implica modelar los cambios de estado realizados por la aplicación como una secuencia inmutable o "registro" de eventos. En lugar de modificar el estado de la aplicación in situ, event sourcing implica almacenar el evento que desencadena el cambio de estado en un registro inmutable y modelar los cambios de estado como respuestas a los eventos en el registro.

Command Query Responsibility Segregation (CQRS) es el patrón de desarrollo de aplicaciones más comúnmente utilizado junto con event sourcing. CQRS implica dividir una aplicación en dos partes: por un lado,  “Command” que ordena al sistema actualizar el estado de los datos, contiene la lógica de negocio y es independiente a la lógica de almacenamiento, y por otro lado “view”, encargada de actualizar los datos en la vista materializada y proveyendo mecanismos de búsqueda rápidas y eficientes.


### Beneficios
* Proporciona un registro completo de cada cambio de estado que se haya realizado en un objeto.
* Permite aplicaciones resilientes; el retroceso de aplicaciones equivale a rebobinar el registro de eventos y los datos de reprocesamiento.
* Mayor rendimiento; las escrituras y las lecturas se pueden escalar de forma independiente.
* Permite una arquitectura de aplicación débilmente acoplada, lo que hace que sea más fácil avanzar hacia una arquitectura basada en microservicios. Reutilizar módulos.
* Versionado de la aplicación. Permite construir una arquitectura de aplicaciones compatible con versiones anteriores: la posibilidad de agregar más aplicaciones en el futuro que necesiten procesar el mismo evento pero crear una vista materializada diferente.

### Desafíos
* Curva de aprendizaje más alta; es un modelo de programación nuevo y desconocido.
* El registro de eventos puede requerir más trabajo para consultarlo, ya que requiere convertir los eventos en el estado materializado requerido adecuado para la consulta.

### ¿Por qué usar ES + CQRS?
Además de las ventajas enumeradas, ante la necesidad de desarrollar la plataforma bajo una arquitectura de microservicios, event sourcing + CQRS encajan a la perfección en el desarrollo del repositorio. Por otro lado, dada la naturaleza del mismo, la gran variedad y cantidad de datos, y los diversos servicios desarrollados, es probable que un único tipo de sistema de almacenamiento no sea capaz de cubrir de forma eficiente todas las necesidades de la aplicación, por lo que la independencia entre la edición y la consulta propicia la persistencia políglota, o lo que es lo mismo, la posibilidad de usar diferentes sistemas de almacenamiento dependiendo de las necesidades.

Event sourcing y Apache Kafka están fuertemente relacionados. Event sourcing implica mantener una secuencia inmutable de eventos a los que se pueden suscribir varias aplicaciones. Kafka es un sistema de mensajería basado en publicaciones y suscripciones de alto rendimiento, baja latencia, escalable y duradero. Por lo tanto, Kafka, como se verá más adelante, puede ser la herramienta perfecta para este tipo de arquitectura.


## Saga
Saga es una secuencia de transacciones que pueden ser intercaladas con otras transacciones.

El término saga se usa comúnmente relacionado con CQRS para referirse a un fragmento de código (manejador de procesos) que coordina y enruta los mensajes entre contextos delimitados y agregados, permitiendo implementar la lógica de negocio mediante el manejo de la secuencia de transacciones la componen.

Por otro lado, saga garantiza que la transacción en cada paso del proceso de negocio tenga una transacción de compensación definida. De esta forma, si el proceso de negocio falla y no puede continuar, puede ejecutar las transacciones de compensación para los pasos que ya se han completado. Esto deshace el trabajo completado y mantiene la consistencia del sistema.

### Beneficios
* Garantiza la coherencia de los datos en múltiples servicios.

### Desafíos
* Complica el diseño y el desarrollo de la aplicación.

### ¿Porqué usar SAGA?
Aplicar saga es necesario para garantizar la coherencia de los datos en REDMIC. La inserción, edición o borrado de un dato en el repositorio, conlleva el uso de múltiples servicios que comprueban, enriquecen, propagan ediciones, etc. Un fallo en alguno de estos ciclos debe ser compensado para garantizar que se vuelve al estado anterior y así mantener la coherencia de los datos.


## Kafka
![](images/kafka-logo.png)
Apache Kafka es una plataforma de transmisión distribuida capaz de manejar billones de eventos al día. Ofrece un sistema de publicación y suscripción de baja latencia, alto rendimiento y tolerante a fallos, y puede procesar flujos de eventos mediante operaciones de streaming. Estas características la convierten en una herramienta ideal no solo para comunicar microservicios en un entorno distribuido, sino también para implementar los patrones estudiados anteriormente, como event sourcing y CQRS.

La forma de implementar event sourcing + CQRS con Kafka es dividir la unidad funcional en dos partes, una parte de la aplicación (Command), procesa las actualizaciones como escrituras en un registro de eventos o topic de Kafka. La otra parte (View) se suscribe al topic de Kafka, transforma el evento (según se requiera) y escribe la vista materializada en el sistema de base de datos que mejor se adapte a las necesidades. Finalmente, los clientes de la aplicación emiten consultas contra la vista.

Por otro lado Kafka Streams es una excelente opción para construir el componente “Event Handler” ya que permite procesar flujos de eventos y transformarlos según se requiera para implementar la lógica de negocio. Por ejemplo, permite hacer uniones entre flujo de eventos para enriquecer datos y a su vez generar un nuevo evento con el dato enriquecido para enviarlo a la vista.

Finalmente y no menos importante, Kafka proporciona una manera eficiente de modelar el estado de la aplicación: permite almacenamiento de los estados de la aplicación de manera local. Cada instancia de una aplicación almacena un subconjunto de estados, este subconjunto viene determinado por el número de particiones y las claves de los mensajes. De esta manera, todos los datos requeridos para atender las consultas que llegan a una instancia de la aplicación están disponibles localmente al compartir claves y particiones. Si no fuera así, existen otros mecanismos para recuperar datos procesados en otras particiones. Kafka Streams proporciona tolerancia a fallos, por lo tanto, si una instancia de la aplicación cae y los fragmentos del state store local alojados se pierden, Kafka Streams puede recrear los fragmentos del state store simplemente leyendo el topic de Kafka y rellenando los datos en el nuevo state store.

### Beneficios
* Tolerancia a fallos. Si falla una instancia de la aplicación, Kafka Streams redistribuye automáticamente las particiones de los topics de Kafka, así como los fragmentos internos del state store entre las instancias de la aplicación restantes.
* Permite escalabilidad. Si se inician nuevas instancias de una aplicación, Kafka Streams mueve automáticamente los fragmentos existentes del state store, así como las particiones de los topics de manera uniforme entre las instancias de la aplicación recién iniciadas, de forma transparente.
* Uso más rápido y eficiente de los datos, ya que son locales a la aplicación (en memoria o posiblemente en SSD). Esto es especialmente útil para aplicaciones que necesitan acceder a grandes cantidades de datos.

### Desafíos
* Las aplicaciones requieren de más cuidados a la hora de administrar.
* Requiere de un cambio de mentalidad con respecto a sistemas de base de datos convencionales.


### ¿Por qué usar Kafka?
Además de los beneficios enumerados anteriormente, Kafka se adapta perfectamente a las necesidades derivadas de la implementación de los patrones de diseño descritos anteriormente. Por otra parte, características como Kafka Streams, que permite el procesado de flujo de datos en tiempo real, o Kafka Connect, que permite la conexión a otros sistemas para extraer o enviar datos, hace que aumente las posibilidades de la plataforma.

Debido a la utilización de Kafka, entran en juego una serie de herramientas que se pueden integrar en la plataforma aumentando significativamente el rendimiento.


## Avro y Schema Registry
Avro proporciona servicios de serialización e intercambio de grandes cantidades de datos entre programas escritos en cualquier lenguaje. Almacena la definición o esquema de datos en formato JSON, lo que facilita su lectura e interpretación. Los datos en sí se almacenan en formato binario, por lo que es mucho más compacto y eficiente que otros formatos como JSON. Por otro lado, los archivos Avro incluyen marcadores que se pueden usar para dividir grandes conjuntos de datos en subconjuntos adecuados para el procesamiento distribuido.

Una característica clave de Avro es que posee un soporte sólido para esquemas de datos que cambian con el tiempo, o lo que es lo mismo poder evolucionar el esquema de los datos. Avro + schema registry es el entorno ideal para mantener la estrategia elegida de cambio de esquemas y mantener la compatibilidad de los datos entre diferentes versiones.

Schema Registry proporciona una interfaz RESTful para almacenar y recuperar esquemas Avro. Almacena un historial versionado de todos los esquemas, proporciona múltiples configuraciones de compatibilidad y permite la evolución de esquemas de acuerdo con la configuración de compatibilidad elegida (compatibilidad de esquema Avro). Por otro lado proporciona serializadores para los clientes de Kafka, que manejan el almacenamiento y la recuperación de esquemas para los mensajes de Kafka que se envían en formato Avro.

## Kafka connect
Kafka Connect es un framework incluido en Apache Kafka que integra Kafka con otros sistemas. Su objetivo es facilitar la incorporación de nuevos sistemas a los flujos de datos de Kafka.

Para intercambiar datos entre Kafka y otro sistema, se crean instancias de Kafka Connectors para los sistemas de los cuales se quieren extraer o enviar datos. Los conectores de origen “source” importan datos de otro sistema (por ejemplo, una base de datos relacional a un topic de Kafka) y los conectores “sink” exportan datos a otros sistemas (por ejemplo, el contenido de un topic de Kafka a S3).

## ES + CQRS + Saga + Kafka para crear microservicios
Al conjunto de componentes que implementan las funcionalidades necesarias para poder integrar nuevos datos en REDMIC, se le llama unidad funcional. Estas unidades funcionales se implementan como microservicios aplicando los patrones y tecnologías vistos anteriormente.

![](/images/CQRS.png){: .center}

Un paso importante para su diseño, es elegir qué datos la van a integrar. Por ejemplo, si se trata de datos geolocalizados, la unidad funcional estará compuesta por el dato principal, más los metadatos asociados a este, que no sean compartidos con otros datos y que por sí mismo aporten valor al repositorio.

También es necesario definir, por un lado, la forma en la que se introducen, editan y eliminan los datos, en caso de ser necesario y por otro lado, el sistema de base de datos idóneo para el tipo de datos que se quiere manejar. Por ejemplo, para una unidad funcional cuyo objetivo es la ingesta de datos de buques a partir de un servicio AIS, se requiere tanto la ingesta de datos vía Kafka, como añadir, editar y eliminar vía Rest. Con respecto al sistema de base de datos, como se trata de datos geolocalizados y metadatos asociados, se utilizará Elasticsearch.

Cada unidad funcional se divide en dos microservicios, command y view, los cuales se describen a continuación.

### Command
Microservicio encargado de actualizar el estado de los datos que integran la unidad funcional, contiene la lógica de negocio y es independiente a la lógica de almacenamiento.

Las acciones realizadas por parte de los clientes se gestionan a partir de unos componentes llamados command. Al procesar un command, se genera un evento que comenzará el ciclo o workflow correspondiente a la acción a realizar, es decir, se generan una sucesión de eventos determinados por diferentes factores (estado actual, comprobaciones, etc) que terminan siempre con un evento de finalización, si todo ha ido bien, o de cancelación, en caso de ocurrir algún fallo. Cada uno de estos ciclos serán descritos a través de un diagrama de flujo.

Cada uno de estos eventos que componen el ciclo, se envían a Kafka. De este modo, otros microservicios o clientes Kafka podrán escuchar estos eventos y actuar en consecuencia si fuera necesario.

Por otro lado, el hecho de almacenar los eventos en Kafka permite que estos sean persistentes, como si de una base de datos se tratase, pudiendo recuperar esta información desde cualquier cliente Kafka. También permite el procesamiento streaming de estos flujo de datos, característica ideal para hacer enriquecimiento de datos, agregaciones y otros tipos de procesamiento de datos de forma rápida y eficaz.

Otra característica importante, es la integración de saga en el sistema. Para ello se introducen los eventos compensatorios, que son aquellos que en caso de que un ciclo falle en algunos de los pasos que lo componen, este evento devuelve el dato a un estado consistente. Por ejemplo, si se envía un comando para borrar un dato, pero este dato está referenciado y no se puede borrar, se enviará un evento de borrado cancelado que devolverá el dato al estado correcto.

Para comprobar el estado de un dato al comienzo de un ciclo, se usa el componente aggregate. Este es el encargado de recuperar los últimos estados del dato y agregarlos en orden para obtener el estado actual. En caso de usar snapshot, cargar el último estado, donde estarán agregados los últimos estados del dato, es suficiente para obtener el estado actual. Los estados se obtienen del state store, una herramienta que provee Kafka para leer los eventos enviados a un topic determinado. Si existe un estado válido para el dato, se aplica en el aggregate y dependiendo del estado actual y el command procesado, se genera un evento de comienzo de ciclo. Si el estado no es válido, automáticamente se genera un evento de compensación para volver a un estado correcto, a la vez que se informa al usuario del error.

#### Crear un item
Crear un dato es una de las acciones más comunes en un microservicio de tipo command de REDMIC. Esta acción se realiza a partir de la ejecución de un comando, que puede ser disparado desde una petición vía rest, mediante un mensaje recibido por el broker, etc.

El ciclo comienza con el procesamiento del comando create por parte del agregado. En primer lugar busca en el state store un evento con el id del elemento a añadir. En caso de no existir, que es lo esperado, se genera un evento create o enrich, dependiendo de si es necesario enriquecer el dato antes de enviarlo a la vista. Pero si por el contrario, existe un evento con el mismo id, se debe comprobar si el elemento está en un estado aceptado para el comando que se va a ejecutar, en el caso de crear, el único estado válido es eliminado, ya que significa que el elemento fue eliminado y se está intentando insertar de nuevo. En caso de que el estado no sea válido, se resuelve con error, sin registrar ningún evento al respecto.

Si el elemento necesita ser enriquecido, un servicio de streaming estará escuchando el correspondiente evento y realizará una unión del dato principal con las fuentes de datos correspondientes, generando un nuevo evento que contendrá el elemento enriquecido.

En este momento entra en juego command handler, que es el componente que gestiona la lógica de este ciclo. Al escuchar el evento que confirma que el dato fue enriquecido correctamente, genera un evento crear, que escuchará la vista para almacenar el dato. Si todo va bien, la vista genera un evento satisfactorio que estará escuchando un servicio de streaming para generar un evento final, construido a partir de la petición de creación, que contiene el elemento a crear y la respuesta. El evento resultante se considera un snapshot, es decir, una instantánea que contiene el estado actual del elemento. Finalmente se resuelve de manera satisfactoria. Sin embargo, si algo no ha ido bien, la vista genera un evento de fallo que escuchará en este caso command handler para generar un evento compensatorio. Esto permite  devolver el elemento a su estado inicial, pero como se trata de una creación, se establece el elemento como eliminado y se resuelve con error.
