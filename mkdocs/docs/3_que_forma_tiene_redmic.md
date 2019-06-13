# ¿Qué forma tiene REDMIC?

## Funcionalidades

En REDMIC existen una serie de módulos conceptuales que aportan funcionalidades específicas a cada una de las unidades que componen la plataforma. De ellos, los diseñados hasta el momento se describen a continuación.

### Ingesta de datos

La adición de nuevos datos se puede realizar de diferentes maneras, con el fin de  facilitar la interoperabilidad. Por ello se contemplan varias vías:

- **Carga de ficheros**. Incluye subida directa (push), descarga periódica desde el servidor (pull) o mediante protocolo FTP, por ejemplo.
- **REST**. Otra opción es mandar los datos a través de peticiones REST, dirigidas a los diferentes servicios disponibles.
- **IoT**. Para la carga automática y continua de datos procedentes de dispositivos IoT (Internet of Things), se aceptan publicaciones en formatos adaptados a estos casos de uso.

### Procesamiento

Una vez añadidos los datos, se debe realizar una serie de tareas sobre los mismos para garantizar que cumplen todos los requisitos establecidos por el repositorio. Estas acciones son entre otras:

- **Control de calidad**. No siempre los datos obtenidos tienen la calidad esperada, algunas veces por fallos en los dispositivos, otras por errores humanos. Por eso se realiza un control de calidad para que a la hora de consumirlos datos se puedan descartar aquellos que no cumplan los requisitos mínimos de calidad.
- **Aplicación de restricciones en los datos**. En REDMIC existen una serie de restricciones en los datos como pueden ser: los embargos, las restricciones de descarga, etc. Tanto a la hora de procesar como de visualizar los datos, se tienen en cuenta estas limitaciones para garantizar estas características.
- **Homogeneización**. A pesar de introducir datos heterogéneos desde diferentes fuentes, estos son almacenados en el mismo formato, así que en ocasiones es necesario someterlos a un proceso previo a su almacenamiento.
- **Enriquecimiento**. En ocasiones, los datos recibidos no son lo completos que se podría esperar. Sin embargo, es posible enriquecerlos con otras fuentes, haciéndolos más atractivos y utilizables, siempre respetando el dato original.

### Visualización

Al contemplar datos de cualquier naturaleza, es importante poder verlos en todas las dimensiones posibles. En REDMIC se permite, siempre que el dato sea susceptible de ello, representar la información organizada en forma de **tabla**, plasmada sobre un **mapa**, o representada en diferentes modalidades de **gráfica**.

A su vez, en cada tipo de visualización es posible combinar datos de distinta fuente o naturaleza, para extraer más información.

### Análisis

Las herramientas analíticas no son el principal objetivo de este proyecto. Sin embargo, en determinados casos, puede ser interesante el desarrollo de alguna de estas herramientas por el valor que aporta a los usuarios. Entre ellas se puede encontrar el análisis de distribuciones, estudios estadísticos, predicciones, etc.

### Descarga

Una vez elegidos los datos de interés, es posible descargarlos. Dependiendo del tipo de dato, la descarga podrá ser de un tipo u otro. Si se desea descargar datos brutos de series temporales, la descarga se realizará en formato CSV, JSON, etc. Si lo que se quiere es conseguir un documento, listado o informe, se usará el formato PDF o un archivo de mapa de bits (JPG, PNG) para el caso de documentos cartográficos elaborados con los diferentes datos que se han integrado.

Un ejemplo de uso concreto es el módulo de corología documentada, que está compuesto por un sistema de ingesta de datos y hace posible la persistencia de los mismos en la plataforma. A continuación se procesan los datos, realizando el control de calidad, aplicando posibles restricciones de seguridad, etc. Una vez integrados en la plataforma, se pueden consultar mediante las herramientas de visualización disponibles o, en caso de existir, usando las herramientas analíticas que permiten estudiar en profundidad estos datos (en este caso se dispone de la herramienta de [distribución de especies](https://redmic.es/viewer/species-distribution )).Finalmente, se puede optar por descargar los datos mediante la herramienta de descarga disponible en cada caso.

## Servicios

REDMIC provee una serie de herramientas para la explotación de los datos almacenados, tanto desde aplicaciones de terceros como desde la propia plataforma.

### Servicios OGC

OGC es un consorcio de ámbito internacional encargado de definir estándares abiertos para protocolos de intercambio de información geoespacial. Entre esos estándares se encuentran WMS y WMTS, que son algunos de los ofrecidos.

### WMS

Es un protocolo de acceso a información geográfica principalmente de forma gráfica, que también permite realizar consultas. Proviene de la expresión en inglés "Web Map Service", una manera de difundir mapas a través de Internet, con una simbología determinada y con ciertas ayudas para interpretar esa representación.

En la práctica consiste en que los usuarios pueden ver los datos espaciales, a menudo con un estilo representativo concreto, una leyenda y la capacidad de pedir con el cursor más información acerca de cualquiera de los elementos geográficos visibles en el mapa. No se obtienen los datos, sino una especie de fotografía de los mismos. La copia es generada sobre la marcha y se adapta a la escala y la región con las que está trabajando el usuario.

### WMTS

Enviar mapas a través de la red tiene sus dificultades. Una de ellas es el tamaño en bits que suelen tener, en ocasiones capaz de colapsar la red. Con el protocolo WMTS el mapa se trocea en porciones llamadas teselas (en inglés *tiles* y de ahí la T en el nombre del protocolo). El servicio transmite esos trocitos y el programa cliente recompone el mapa con las instrucciones que el propio protocolo WMTS tiene establecidas.

En REDMIC se sirven diversos mapas mediante protocolos WMS y WMTS, de manera que se pueden examinar los datos en mapas pre-elaborados. Además se pueden consumir desde aplicaciones de terceros o aplicaciones de escritorio de tipo SIG, aumentando las posibilidades de explotación de los datos.

### RESTful

Con el esquema REST de consultas y servicios se accede a la información en bruto almacenada, no a un producto preparado. En respuesta a una petición, se recibe una ficha que recoge los datos que se piden junto, posiblemente, a otros contenidos auxiliares. Entre ellos pueden estar su representación espacial, su nivel de fiabilidad, etc. Cada conjunto de datos tiene su propia dirección de Internet (URL), así que REST permite hacer consultas directas a los datos según una serie de reglas propias de cada servicio, lo que se conoce como API. Así, se puede escribir un programa cliente que sepa hacer preguntas siguiendo esas reglas, afinar las búsquedas, obtener información e, incluso, modificar o aportar nuevos datos (dentro de lo que el dueño del servicio establezca).

REST se define como una arquitectura, un modo de construir servicios, escalable, con un lenguaje para comunicarse sencillo, con cuatro órdenes básicas (GET, PUSH, PUT y DELETE, aunque no son las únicas) para obtener, crear, editar y borrar datos, en este orden.

Gracias a esta abstracción, se pueden crear aplicaciones que consuman la información a través de REST. De hecho, la propia aplicación web de REDMIC sigue esta filosofía. Al igual que los servicios OGC, los servicios REST aumentan considerablemente las posibilidades de explotación de los datos.

### Aplicación web

La principal puerta de acceso de los usuarios a la plataforma REDMIC es la aplicación web. Se trata de una interfaz que trabaja sobre los servicios explicados anteriormente, exponiendo a los usuarios una manera directa de interactuar con ellos.

Permite consumir, añadir y editar datos al repositorio, e incorpora algunas herramientas analíticas para ayudar a descubrir la información.

Es un ejemplo del potencial que ofrece la plataforma, ya que se pueden desarrollar otros clientes que, por ejemplo:
- exploten la información desde otros puntos de vista.
- implementen sus propias herramientas analíticas.
- se adapten a otros dispositivos.

## Tipos de dato

REDMIC establece diferentes clasificaciones para los datos, atendiendo al modo de representación, al modo de obtención o al ámbito del conocimiento al que pertenezcan. Así, tenemos:

Según el sistema empleado en su recogida:

- **Directos**. Datos obtenidos desde una medición in situ.
    - *Tiempo real*. Datos transmitidos directamente desde el dispositivo. Hoy en día, muchos dispositivos son capaces de enviar los datos recogidos a través de Internet u otro sistema, ya sea en tiempo real o cada cierto tiempo. Por ejemplo: un correntímetro, una estación meteorológica, etc.
    - *Diferidos*. Datos que han de ser descargados o extraídos de un dispositivo. Por ejemplo: una sonda multiparamétrica, un perfilador, etc.
- **Indirectos**. Datos obtenidos del análisis de muestras.
- **Derivados**. Datos elaborados o calculados a partir de otros. Por ejemplo, salinidad obtenida a partir de conductividad, mapas o datos espaciales obtenidos a partir de la interpretación de disposiciones legales o descriptivas.

Según el ámbito o dominio temático que representen:

- **Geológicos y geomorfológicos**. Datos sobre  la naturaleza física de los fondos, como el tipo de lecho marino, mineralogía, tectónica, perfiles estratigráficos, registros de actividad sísmica, etc. Caben aquí levantamientos batimétricos, accidentes geográficos submarinos, tipos de sustrato y granulometría de sedimentos.
- **Hidrológicos y climatológicos**. Todo lo relacionado con el clima marítimo y la dinámica de las aguas (mareas, corrientes, oleaje, tasas de sedimentación, etc.).
- **Físicos y químicos**. Parámetros descriptivos de las condiciones físicas (temperatura, densidad, luz, etc.) y químicas (nutrientes, oxígeno disuelto, pH, salinidad, etc.) del agua o los sedimentos.
- **Biológicos**. Todo el universo de datos acerca de los seres vivos marinos (inventarios de biodiversidad, avistamientos, marcado de animales, producción planctónica, análisis microbiológicos, mareas rojas, clasificación de hábitats, etc.).
- **Elementos antrópicos**. Todo tipo de datos abstractos (p.ej. demarcaciones jurisdiccionales, áreas protegidas, zonas de pesca) y reales (infraestructuras emplazadas en el mar, basuras, vertidos, etc.) cuyo origen es la actividad humana. Este grupo incluye también el tráfico marítimo y los del aprovechamiento o explotación de recursos marinos por parte del ser humano.
- **Especiales**. Datos singulares de diversa índole no asignables a ninguna de las categorías anteriores, aunque puedan estar relacionados con los elementos que contienen. Por ejemplo, las imágenes de satélite o de vídeo, los registros sonoros, los variados resultados de los modelos (mapa de vientos, corrientes, etc.), o el estado de las baterías de un instrumento.

Según el modelo geométrico empleado para representar el dato:

- **Vectoriales**. Almacenando solo las coordenadas imprescindibles que permitan reconstruir la forma geométrica del dato: elementos puntuales, elementos lineales y áreas.
- **En malla**. En este modelo la realidad se representa dividiendo el espacio en unidades elementales muy pequeñas en relación a las dimensiones del hecho representado, de manera que aquellas que se encuentren espacialmente relacionadas con esa realidad, reciben un valor distinto al resto circundante. Ese valor puede reflejar una medición o solo la geometría del elemento real.

    - *Mapa de bits*. Si la geometría se representa mediante un plano compuesto por cuadrículas que cubren todo el espacio en el que se extiende el hecho que se quiere recoger. Aquí la unidad elemental es la cuadrícula o píxel. Un ejemplo conocido es una fotografía digital.
    - *Mallado, mesh o nube de puntos*. Al representar valores en un volumen (3D). En este caso, en función de si esos puntos tienen o no una distribución regular, se habla de mesh o de nube de puntos, respectivamente. Se trata de posiciones dentro de un espacio de 3 dimensiones en el que se conoce el valor de la medición. Mediante interpolaciones es posible construir superficies o volúmenes sólidos que permitan entender el fenómeno que se modela.

## ¿Y por qué no usar un SIG?

REDMIC no es un sistema de información geográfica (SIG o GIS, en inglés), aunque se le parece mucho. Los SIG se construyen para poder resolver problemas concretos o ayudar en la toma de decisiones, cuando interviene información geográfica. Este proyecto no se concibe para resolver problemas en los que la geografía es el único punto importante, pues su principal objetivo es resolver problemas de acceso a información científica.

REDMIC empezó con esa idea en mente, pero de esa clase existen muchos y excelentes productos en el mercado. El nicho sin explotar y la necesidad sin cubrir no estaba en la representación de los datos ni en las habilidades de análisis. Ni siquiera en la gestión de bases de datos. La respuesta que se necesitaba era la integración sin tensiones, rozamientos o discontinuidades en la información. En inglés le dicen *seamless*, sin costuras, formando todo una pieza, un continuo.



