# Sistema


## Estructura
A finales de 2018, se cuentan con 4 servidores.
La estructura actual Actualmente se cuenta con 4 servidores
Se utiliza docker swarm
![servers_infrastructure](images/servers_infrastructure.png){: .center}

Todos los servidores pertenecen a una misma red (VPC), pero cada zona cuenta con una subred más una exclusiva para el manager, es decir, existen 4 subredes. Esto hace que si en un futuro aumenta el número de servidores, los nuevos equipos se uniran a las subredes existentes.

El manager es el encargado de exponer de exponer los diferentes servicios a internet, es por eso que es el único servidor accesible desde el exterior, siempre controlando que puertos se exponen a través de un firewall.

Los workers son servidores de ejecutar los servicios, están distribuidos entre las 3 zonas que provee Amazon en la región "eu-west-1", esta distribución evita que la aplicación deje de responder si alguna de las zonas cae.

Esta distribución de servidores se ha optado como esquema base para desplegar una docker swarm.

### Despliegue
Para el aprovisionamiento de todas estas máquinas, con sus respectivos requisitos se ha utilizado como base la plantilla de CloudFormation que proporciona [Docker](https://docs.docker.com/docker-for-aws/){: target="_blank"}.

Se utiliza una plantilla de CloudFormation para el despliegue de la infraestructura.

Se definen tipos de máquinas, tamaño de los discos, VPC, imagen ISO, 4 VPC
Los servidores workers no son accesibles desde fuera de VPC, el único servidor accesible es el manager, que es encargado de repartir la carga entre los workers.

