# Concepto

![](images/redmic-logo.png){: .center}

REDMIC está concebido como un sistema de gestión de datos marinos organizado sobre una mismo repositorio de datos integrando el máximo posible de diferentes tipos de datos marinos (oceanográficos, biológicos, hidrodinámicos, pesqueros, geológicos, de tráfico marítimo, etc.). Dicho sistema ha de permitir el registro, validación, búsqueda, recuperación, visualización, análisis y exportación de los datos, así como la ágil conexión (interoperabilidad) con otros repositorios o nodos de mayor rango, preferentemente europeos.

Hay tres principios que han tenido especial peso en su concepción:

* Sin datos no se va a ninguna parte, y con datos malos se llega al sitio equivocado. El control de calidad y el rigor en la gestión de datos son cuestiones fundamentales.
* Obtener datos del mar es caro y laborioso. Se trata de obtener el dato una vez y potenciar su uso al máximo y todas las veces que haga falta.
* Los datos obtenidos con fondos públicos deben ser accesibles a todos los potenciales usuarios.

REDMIC es un sistema de información geográfica en cierto modo peculiar, pues se organiza como repositorio común de datos en función del tipo de dato y no en función de aplicaciones concretas con fines específicos (pesquerías, navegación, gestión costera, etc.), como es habitual en el diseño de la mayoría de los GIS. Podría entenderse como un híbrido entre una base de datos científica y un GIS clásico. La idea básica es almacenar de forma integrada cualquier tipo de dato marino (oceánico + costero) que tenga un referente geográfico, maximizando así su explotación, pero respetando siempre el dato original y las circunstancias en que se generó. Obtener el dato una vez y usarlo muchas, pero en vez de hacerlo a través de la interoperabilidad entre varias bases de datos, que es el enfoque tradicional, REDMIC apuesta por la generatividad que surge de un modelo integrado.

La estrategia adoptada en REDMIC consiste en vincular los datos siempre a la actividad que los genera, con toda la información asociada (metadatos), evitando la redundancia de información, que se estructura básicamente según la clásica secuencia de: quién, dónde, cuándo, qué y cómo. Al estar todos los datos vinculados por el factor geográfico y recogidos en un mismo repositorio, la facilidad para correlacionar unos con otros es óptima y justifica el esfuerzo inicial de integrarlos.