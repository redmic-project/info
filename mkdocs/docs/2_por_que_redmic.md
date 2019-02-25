# ¿Por qué REDMIC?
REDMIC nace como una solución a diferentes problemas que se plantean a la hora de realizar un proyecto o investigación. Normalmente, cuando se comienza a trabajar sobre el mismo, se realiza una tarea de recopilación de datos procedentes de diferentes fuentes y de distinta naturaleza. Esto implica recorrer infinidad de páginas webs, diferentes repositorios, bibliotecas, instituciones, revistas e incluso acudir personalmente a buscar los datos deseados.

Esto en el mejor de los casos, ya que muchas veces no hay manera de averiguar si la información existe o cómo conseguirla. Incluso en ocasiones, esos datos existieron pero han acabado en la basura.

Si finalmente se han conseguido los datos, éstos se pueden encontrar en todo tipo de formatos, sin unidad de medida, sin la fecha de la toma del dato o con información incierta.

¿Sería posible un lugar común donde encontrar rápidamente toda la información y que los datos estuvieran homogeneizados? Sí, este lugar es REDMIC.

## Conceptos clave

Hay tres principios que han tenido especial peso en la concepción del repositorio:
- Sin datos no se va a ninguna parte, y con datos erróneos se llega al sitio equivocado. El control de calidad y el rigor en la gestión de los datos son       fundamentales.
- Obtener datos del mar es caro y laborioso. Obtener el dato una vez y potenciar su uso al máximo se hace indispensable.
- Los datos obtenidos con fondos públicos deben ser accesibles a todos los potenciales usuarios.

Para atenerse a ellos, se han aplicado conceptos ampliamente aceptados y empleados por la comunidad científica.

### Open Data

Los datos abiertos (open data) son datos que pueden ser reutilizados y redistribuidos libremente por cualquier persona, sin detrimento de que puedan estar sujetos al requerimiento de atribución y de compartirse de la misma manera en que se han obtenido.

En este sentido, REDMIC estipula que una vez que los datos han superado el periodo de embargo (si lo hubiera), quedan a disposición de todos los usuarios, para su visualización o descarga desde la aplicación web o, incluso, consumirlos vía API REST o servicios WMS/WMTS .

### Open Science

Open Science representa un nuevo enfoque para el proceso científico, basado en el trabajo cooperativo y en nuevas formas de difundir el conocimiento mediante el uso de tecnologías digitales y nuevas herramientas colaborativas. 

La publicación de datos recabados y producidos en el curso de investigaciones científicas, para que puedan ser reutilizados, es un pilar básico de REDMIC.

### Citizen Science

Citizen Science engloba el trabajo científico realizado por miembros del público en general, a menudo en colaboración con o bajo la dirección de científicos profesionales e instituciones científicas.

Utilizar datos recogidos por la ciudadanía puede aportar información importante para realizar estudios o análisis. Hay que ser consciente de lo complicado que resulta recoger datos acerca de los acontecimientos que ocurren en el mar. Por ello, en REDMIC cualquier persona puede aportar datos, sin necesidad de ser científico.

### Open Source

El modelo Open Source defiende el desarrollo descentralizado de software , que fomenta la colaboración de distintas partes. Permite modificar el código fuente y su redistribución, en función de su licencia.

Como proyecto financiado con dinero público, el desarrollo de REDMIC debe ser libre, para poder consultar su código fuente y ser utilizado por otras personas o instituciones. Se abre así la posibilidad del desarrollo de nuevas funcionalidades por parte de terceros, que posteriormente se podrán integrar en REDMIC, añadiendo valor a la plataforma.

## ¿Qué estrategia sigue?

La estrategia adoptada consiste en vincular los datos siempre a la actividad que los genera, con toda la información asociada a los mismos (metadatos), evitando la redundancia de información. Se estructura siguiendo estas cinco preguntas:

| Pregunta | Descripción |
|:-:|-|
| ![who](images/diver.png) | Guardar **quién** recoge los datos permitirá dar autoría de los mismos, lo que se traduce en el reconocimiento por parte de la comunidad científica y en el fomento de posibles colaboraciones. Además, los usuarios pueden ayudar a ampliar y/o mejorar los datos. |
| ![what](images/turtle.png) | Saber **qué** se recoge es algo fundamental, sobre todo en un mundo tan cambiante como es el medio marino. REDMIC, en función del tipo de dato que se está registrando, permite la definición de una serie de campos que describirán de forma exhaustiva el dato recogido. |
| ![where](images/point.png) | Conocer **dónde** se han recogido los datos permitirá realizar correlaciones espaciales con otros datos, o descubrir qué información existe en una zona determinada, algo fundamental para hacer planificación. |
| ![how](images/catcher.png) | Saber **cómo** se recogen los datos es muy importante y puede hacer variar los resultados de un estudio, así que especificar las técnicas y dispositivos utilizados en la recogida de los datos es determinante para un repositorio de datos. |
| ![when](images/clock.png)  | **Cuándo** se recogen los datos es otro factor importante, ya que permitirá realizar estudios temporales, como detectar patrones de comportamiento, evaluar la evolución de un ecosistema, etc. |


No todos los datos deben cumplir todos los requisitos anteriores, dependerá muchas veces de su tipo. Pero, cuantos más requisitos cumpla el dato, mayor será su calidad y más utilidad tendrá.

> Se toma una vez, se usa muchas veces

Obtener datos del mar es caro y laborioso. Uno de los principios inspiradores de REDMIC es potenciar el uso de un dato al máximo, con el fin de facilitar el conocimiento y la gestión del medio marino, así como sus recursos. Cuando un dato es incorporado se hace permanentemente accesible, se facilita su uso sucesivo a largo plazo. De este modo, se maximiza su uso potencial, tanto por la persona o institución que generó esos datos, como por el resto de la comunidad.

##¿Y cómo funciona?

REDMIC hace uso de tecnologías big data y de una estructura modular compuesta por pequeñas "aplicaciones" independientes pero interconectadas entre sí, facilitando la integración de nuevos tipos de datos sin realizar un gran esfuerzo.

Más fácil con un ejemplo. Si surgiera la necesidad de registrar un histórico de la recogida de basura en las playas, es posible crear un módulo que se encargue de esta labor, trabajando de manera independiente de los ya creados. Posteriormente, se pueden cruzar dichos datos con otros ya registrados, como por ejemplo el seguimiento de posición de barcos en la zona. Entonces, ¿se podría obtener una relación entre el tráfico de barcos en la zona y la cantidad de basura recogida? La respuesta es sí, y sólo llevaría unos segundos (o incluso en tiempo real, si fuese necesario) obtener la respuesta, en lugar de pasar semanas recopilando datos de diferentes fuentes, homogeneizando, pasando controles de calidad, etc.



