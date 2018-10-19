# Sistema
En este capítulo se explica la arquitectura general de REDMIC, es decir, cómo se ha organizado toda la aplicación software, hardware y seguridad para dar respuesta al objetivo principal de «facilitar el máximo uso posible de un dato marino», con todo lo que ello implica (tipos de usuarios, estrategias de desarrollo, funcionalidades, productos, etc.). Para ponerlo en contexto, se adjunta un diagrama muy simple del flujo de datos con sus entradas y sus salidas.

## Estructura
La estructura actual Actualmente se cuenta con 4 servidores
Se utiliza docker swarm
![servers_infrastructure](images/servers_infrastructure.png){: .center}

### Despliegue
Se utiliza una plantilla de CloudFormation para el despliegue de la infrastructura

Se definen tipos de máquinas, tamaño de los discos, VPC, ISO, 4 VPC
Los servidores workers no son accesibles desde fuera de VPC, el único servidor accesible es el manager, que es encargado de repartir la carga entre los workers.

