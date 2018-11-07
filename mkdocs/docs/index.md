# Concepto
## ¿Qué es REDMIC?

---
IDEAS

REDMIC son las siglas de Repositorio de Datos Marinos Integrados de Canarias, 


Esta capacidad hace a REDMIC una herramienta única, ya que

REDMIC no se limita a ser un simple buscador que recorre diferentes web en busca de los datos o IDEs,

Cruzar con otros datos
Visualizar datos de diferentes maneras: mapas, gráficas
Herramientas analíticas integradas

Aunque se sigue una filosofía Open Data no sé limita a un simple almacén de ficheros con un buscador

El tener un sitio común, con datos homogenizados permitirá en un futuro generar mejores informes, planificación, etc.

Pasamos de la tendencia de modelos descentralizados a centralizar todos los datos en un mismo lugar, ya que favorece el análisis ...


REDMIC está concebido como un sistema para la gestión de datos marinos, sin tener en cuenta su origen; oceanográficos, biológicos, hidrodinámicos, pesqueros, geológicos, tráfico marítimo, etc. en una sola herramienta. Esta característica convierte a REDMIC en un repositorio único.

Esta integración de los datos permitirá en un futuro, poder estudiar hábitats con mayor agilidad y precisión.

Todo ello siguiendo una filosofía [Open Data](https://es.wikipedia.org/wiki/Datos_abiertos) y [Open Science](https://es.wikipedia.org/wiki/Ciencia_abierta).

Tecnología de [Big Data](https://es.wikipedia.org/wiki/Macrodatos).

REDMIC es el resultado de la unión de pequeñas "aplicaciones" trabajando conjuntamente.

Trazabilidad de los datos, todo dato incorporado en REDMIC tendrá un histórico de como ha ido evolucionando, es decir, se sabrá en todo momento quién lo ha modificado.

---

Un lugar centralizado dónde encontrar casi cualquier dato relacionado con el entorno marino, sin tener en cuenta su origen; oceanográficos, biológicos, hidrodinámicos, pesqueros, geológicos, etc.


Dicho sistema permite el registro, validación, búsqueda, custodia, recuperación, visualización, análisis y exportación de los datos.

![data_sources](images/data_sources.jpg){: .shadow}

Hay tres principios que han tenido especial peso en su concepción:

* Sin datos no se va a ninguna parte, y con datos malos se llega al sitio equivocado. El control de calidad y el rigor en la gestión de datos son cuestiones fundamentales.
* Obtener datos del mar es caro y laborioso. Obtener el dato una vez y potenciar su uso al máximo se hace indispensable.
* Los datos obtenidos con fondos públicos deben ser accesibles a todos los potenciales usuarios.

REDMIC es un sistema de información geográfica en cierto modo peculiar, pues se organiza como repositorio común de datos en función del tipo de dato y no en función de aplicaciones concretas con fines específicos, como es habitual en el diseño de la mayoría de los [GIS](https://es.wikipedia.org/wiki/Sistema_de_informaci%C3%B3n_geogr%C3%A1fica){: target="_blank"}.

Sin embargo, esto no significa que REDMIC sea una aplicación sobredimensionada.


Mediante el uso de tecnologías *big data* y una estructura modularizada compuesta por pequeñas "aplicaciones" independientes pero interconectadas entre sí, que permite la posterior integración con cualquier tipo de dato del repositorio. Más fácil con un ejemplo. Si se descubre la necesidad de registrar un histórico de la recogida de basura en las playas, es posible crear un módulo que se encargue de esta labor, independiente de los ya creados. Posteriormente se puede cotejar dichos datos con otros ya registrados, como por ejemplo, los tracks de barcos en la zona. Ajá! entonces, ¿se podría obtener una relación entre el tráfico de barcos en la zona y la cantidad de basura recogida? La respuesta es que con REDMIC solo nos haría falta unos segundos o incluso si fuera necesario en tiempo real, en lugar de pasar semanas obteniendo datos de diferentes fuentes, homogeneizando los datos, pasando control de calidad, etc.

La estrategia adoptada en REDMIC consiste en vincular los datos siempre a la actividad que los genera, con toda la información asociada (metadatos), evitando la redundancia de información, que se estructura siguiendo estas cinco preguntas.

| | |
|:-:|-|
| ![who](images/diver.png)   | Guardar **quién** recoge los datos permitirá dar autoría de los mismos, lo que se traduce en el reconocimiento de la comunidad científica así como el fomento de posibles colaboraciones. Además, los usuarios de REDMIC pueden ayudar a ampliar y/o mejorar los datos.  |
| ![what](images/turtle.png) | Saber **qué** se recoge es algo fundamental, sobre todo en un mundo tan cambiante como el medio marino. REDMIC, en relación con el tipo de datos que se está registrando, permite la definición de una serie de campos que describirán de forma exhaustiva dichos datos.  |
| ![where](images/point.png) | Conocer **dónde** se han recogido los datos permitirá poder realizar correlaciones espaciales con otros datos, o descubrir qué especies existen en una zona, algo fundamental para hacer planificación. |
| ![how](images/catcher.png) | Saber **cómo** se recogen los datos es muy importante y puede hacer variar los resultados de un estudio, así que especificar las técnicas y dispositivos utilizados en la recogida de los datos es determinante para un repositorio de datos. |
| ![when](images/clock.png)  | **Cuándo** se recogen los datos es otro factor importante, ya que permitirá detectar patrones de comportamiento, evaluar la evolución de un ecosistema, etc. |

No todos los datos deben de cumplir todos los requisitos anteriores, dependerá muchas veces del tipo de dato, pero cuantos más requisitos cumpla, mejor será el dato y más utilidad se le podrá dar.

## Tipo de datos
Debido a la gran variedad de datos que abarca REDMIC, se pueden clasificar dependiendo del sistema de recogida de los mismos:

* *Directos.* Datos obtenidos desde una medición in situ.
    * *Tiempo real.* Datos transmitidos directamente desde el dispositivo. Hoy en día, muchos dispositivos son capaces de enviar los datos recogidos a través de Internet u otro sistema, ya sea en tiempo real o cada cierto tiempo. Por ejemplo: un correntímetro, una estación meteorológica, etc.
    * *Diferidos.* Datos que necesitan se descargados o extraídos de un dispositivo. Por ejemplo: una sonda multiparamétrica, un perfilador, etc.
* *Indirectos.* Datos obtenidos de muestras.
* *Derivados.* Datos elaborados a partir de otros.


## Fuentes
* **Geológico - geomorfológicos.** Datos referentes a la naturaleza física de los fondos, como el tipo de lecho marino, mineralogía o granulometría. Se incluyen también levantamientos batimétricos, perfiles estratigráficos y los registros de la actividad sísmica.
* **Hidrológico - climatológicos.** Todo lo relacionado con el clima marítimo y la dinámica de las aguas (mareas, corrientes, oleaje, tasas de sedimentación, etc.).
* **Físico - químicos.** Parámetros descriptivos de las condiciones físicas (temperatura, pH, salinidad, etc.) y químicas (nutrientes, oxígeno disuelto, etc.) del agua o los sedimentos.
* **Biológicos.** Todo el complejo universo de datos relacionados con los seres vivos marinos (inventarios de biodiversidad, avistamientos, marcado de animales, producción planctónica, análisis microbiológicos, mareas rojas, clasificación de hábitat, etc.).
* **Elementos antrópicos.** Todo tipo de datos abstractos (p.ej. demarcaciones jurisdiccionales, áreas protegidas, zonas de pesca) y reales (infraestructuras emplazadas en el mar, basuras, vertidos, etc.) cuyo origen es la actividad humana. Este grupo incluye también el tráfico marítimo.
* **Aprovechamientos.** Datos que refieren al aprovechamiento o explotación de recursos marinos por parte del hombre, independiente de su naturaleza. Incluye los geológicos (arenas, etc.), energéticos (mareas, hidrocarburos, etc.) y biológicos (pesca, marisqueo, maricultura, etc.).
* **Especiales.** Datos singulares de diversa índole no asignables a ninguna de las categorías anteriores, aunque puedan estar relacionados con los elementos que contienen. Por ejemplo, las imágenes de satélite o de vídeo, los registros sonoros, los variados resultados de los modelos (mapa de vientos, corrientes, etc.), o el estado de las baterías de un sensor automático.


## ¿Cómo colaborar con REDMIC?
Si te gusta el proyecto y estas interesado en colaborar tienes varias formas de hacerlo.

![hands](images/hands.png){: .shadow}

### Aportando datos

Subiendo tus datos a REDMIC hará que tu trabajo obtenga mayor repercusión ya que estará disponible para toda la comunidad científica. Además, podrás utilizar las herramientas existentes sobre tus datos, así como enriquecer tus datos con los existentes. Este concepto funciona a la perfección en otros ámbitos como el desarrollo de software, arquitectura, etc, donde los desarrolladores exponen su trabajo para que otros puedan hacer uso de él, mejorarlo o incluso proponer colaboraciones. Es un escaparate perfecto para dar a conocer tu trabajo y que no se pierda en una gaveta.

#### ¿Cómo puedo aportar datos?
Todavía estamos en fase de desarrollo, así que por ahora puedes aportar datos enviándolos por correo a [info@redmic.es](mailto:info@redmic.es), en el futuro este proceso se podrá realizar desde la web.

#### ¿Soy investigador y necesito esperar a publicar para liberar mis datos?
En REDMIC, hemos pensado en estos casos donde los investigadores que desean que sus datos no sean accesibles hasta que hagan sus publicaciones, para ello, REDMIC tiene la posibilidad de embargar tus datos por un tiempo determinado, esto hará que los datos sólo sean accesibles por su dueño y personas que el decida. De esta forma, una vez acabe el tiempo de embargo o el investigador así lo decida, los datos se harán públicos para todo el mundo.

Por ética, si tu trabajo ha sido financiado con fondos públicos y no existe alguna restricción jurídica sobre ellos, deberías de liberarlos a la comunidad para que puedan ser usados de nuevo en futuros estudios o análisis.

#### No soy investigador pero me gustaría colaborar
Si no eres investigador, también puedes colaborar, desde REDMIC apoyamos la ["Ciencia ciudadana"](https://es.wikipedia.org/wiki/Ciencia_ciudadana) (Citizen Sciencie) y creemos que es una herramienta muy valiosa, es por ello que si tienes fotos de especímenes o algo relacionado con el mar y que creas que puede ser útil envíanosla, estaremos muy agradecidos.

### Reportando errores
No sólo puedes colaborar subiendo datos, también puedes reportar errores en los datos, problemas en la aplicación o incluso sugerencias, todas ellas serán bien recibidas.

## Si eres una organización
Si eres una organización y tienes pensado crear o desarrollar una herramienta para publicar o analizar tus datos, antes de tomar esta decisión piensa en colaborar con REDMIC, ponte en contacto con nosotros y buscaremos la forma de como integrar vuestros datos.

## Colaboradores
Algunos instituciones que han aportado datos.

![ieo](images/ieo.jpg)
![loro_parque](images/loro_parque.png)
