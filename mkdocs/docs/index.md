# Concepto
## ¿Qué es REDMIC?
REDMIC está concebido como un sistema para la gestión de datos marinos, sin tener en cuenta su origen; oceanográficos, biológicos, hidrodinámicos, pesqueros, geológicos, tráfico marítimo, etc. en un solo herramienta. Esta característica convierte a REDMIC en una herramienta única.


Dicho sistema permite el registro, validación, búsqueda, recuperación, visualización, análisis y exportación de los datos.

![data_sources](images/data_sources.jpg){: .shadow}

Hay tres principios que han tenido especial peso en su concepción:

* Sin datos no se va a ninguna parte, y con datos malos se llega al sitio equivocado. El control de calidad y el rigor en la gestión de datos son cuestiones fundamentales.
* Obtener datos del mar es caro y laborioso. Obtener el dato una vez y potenciar su uso al máximo.
* Los datos obtenidos con fondos públicos deben ser accesibles a todos los potenciales usuarios.

REDMIC es un sistema de información geográfica en cierto modo peculiar, pues se organiza como repositorio común de datos en función del tipo de dato y no en función de aplicaciones concretas con fines específicos, como es habitual en el diseño de la mayoría de los [GIS](https://es.wikipedia.org/wiki/Sistema_de_informaci%C3%B3n_geogr%C3%A1fica){: target="_blank"}.

La estrategia adoptada en REDMIC consiste en vincular los datos siempre a la actividad que los genera, con toda la información asociada (metadatos), evitando la redundancia de información, que se estructura:

| | |
|:-:|-|
| ![who](images/diver.png)   | Guardar **quién** recoge los datos permitirá dar autoria de los mismos, y poder pedir responsabilidades. |
| ![what](images/turtle.png) | Saber **qué** se recoge es algo fundamental, sobre todo en un mundo tan cambiante como el medio marino. |
| ![where](images/point.png) | Conocer **dónde** se han recogido los datos permitirá poder realizar correlaciones espaciales con otros datos, o más simple poder descubrir que especies existen en una zona, algo fundamental para hacer planificación. |
| ![how](images/catcher.png) | Saber **cómo** se recogen los datos es algo fundamental, y puede hacer variar los resultados de un estudio, así que especificar las técnicas utilizadas en la recogida de los datos es algo determinante para un repositorio de datos. |
| ![when](images/clock.png)  | **Cuándo** se recogen los datos es otro factor importante, ya que permitirá detectar patrones de comportamiento, evaluar la evolución de un ecosistema, etc. |


No todos los datos deben de cumplir todos estos requisitos, dependerá muchas veces del tipo de dato, pero cuanto más de ellos cumpla mejor será el dato y más utilidad se le podrá dar.

## Tipos de datos
Debido a la gran variedad de datos que abarca REDMIC, se pueden tener diferentes tipos de datos, dependiendo del sistema de recogida de los mismos:

* *Directos.* Datos obtenidos desde una medición in situ.
    * *Tiempo real.* Datos transmitidos directamente desde el dispositivo. Hoy en día, muchos dispositivos son capaces de enviar los datos recogidos a través de Internet u otro sistema, ya sea en tiempo real o cada cierto tiempo. Por ejemplo: un correntímetro, una estación meteorológica, etc.
    * *Diferidos.* Datos que necesitan se descargados o extraídos de un dispositivo. Por ejemplo: una sonda multiparamétrica, un perfilador, etc.
* *Indirectos.* Datos obtenidos de muestras.
* *Derivados.* Datos elaborados a partir de otros.


## Fuentes
* **Geológico - geomorfológicos.** Datos referentes a la naturaleza física de los fondos, como el tipo de lecho marino, mineralogía o granulometría. Se incluyen también levantamientos batimétricos, perfiles estratigráficos y los registros de la actividad sísmica.
* **Hidrológico - climatológicos.** Todo lo relacionado con el clima marítimo y la dinámica de las aguas (mareas, corrientes, oleaje, tasas de sedimentación, etc.).
* **Físico - químicos.** Parámetros descriptivos de las condiciones físicas (temperatura, ph, salinidad, etc.) y químicas (nutrientes, oxígeno disuelto, etc.) del agua o los sedimentos.
* **Biológicos.** Todo el complejo universo de datos relacionados con los seres vivos marinos (inventarios de biodiversidad, avistamientos, marcado de animales, producción planctónica, análisis microbiológicos, mareas rojas, clasificación de hábitat, etc.).
* **Elementos antrópicos.** Todo tipo de datos abstractos (p.ej. demarcaciones jurisdiccionales, áreas protegidas, zonas de pesca) y reales (infraestructuras emplazadas en el mar, basuras, vertidos, etc.) cuyo origen es la actividad humana. Este grupo incluye también el tráfico marítimo.
* **Aprovechamientos.** Datos que refieren al aprovechamiento o explotación de recursos marinos por parte del hombre, independiente de su naturaleza. Incluye los geológicos (arenas, etc.), energéticos (mareas, hidrocarburos, etc.) y biológicos (pesca, marisqueo, maricultura, etc.).
* **Especiales.** Datos singulares de diversa índole no asignables a ninguna de las categorías anteriores, aunque puedan estar relacionados con los elementos que contienen. Por ejemplo, las imágenes de satélite o de vídeo, los registros sonoros, los variados resultados de los modelos (mapa de vientos, corrientes, etc.), o el estado de las baterías de un sensor automático.


## ¿Por qué poner tus datos en REDMIC?
Colaborar con REDMIC, subiendo tus datos hará que tengas mayor repercusión ya que estarán disponibles para toda la comunidad científica.

Por ética, si tu trabajo ha sido financiado con fondos públicos y no existe alguna restricción jurídica, deberías de liberar tus datos a la comunidad para que puedan ser usados de nuevo en futuros estudios o análisis.

Por otro lado, podrás correlacionar tus datos con otros datos usando las herramientas disponibles en REDMIC, que irán aumentando a medida que el proyecto avance en su desarrollo.




