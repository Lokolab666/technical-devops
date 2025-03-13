## Architecture

En el diagrama, se puede observar los tres flujos que contienen la solución de la arquitectura para una aplicación web escalable, cumpliendo con las especificaciones.

- Uso de contenedores (Docker) y orquestación (Kubernetes).
- Integración de una base de datos (PostgreSQL o MongoDB) con alta disponibilidad.
- Un pipeline CI/CD para despliegues automáticos.
- Monitoreo del sistema con Prometheus y Grafana.

![Arquitectura](./pic1.png)

## CI/CD

Se inicia con un repositorio en un Git donde se versiona el código y se realizan las tareas de construcción (planificadas) y prueba cada vez que se realiza un commit de forma automatizada. 

Una vez validado el código, SonarQube analiza la calidad y el cumplimiento de buenas prácticas antes de empaquetar la aplicación en contenedores Docker que se almacenan en un registro de imágenes. 

Además, Argo CD automatiza el despliegue de estas imágenes en un entorno de Kubernetes, asegurando que cualquier cambio validado llegue de forma continua al entorno de producción. 

## Front, Back y Base de Datos

Como se observa, se aplica Next.js para el front, el cual se va a ejecutar dentro de un contenedor Docker, y se encarga de la interfaz de usuario que se comunica con la capa de servicios. 

La parte del back está compuesta por microservicios empacados en contenedores Docker y orquestados en Kubernetes, utilizando Nginx para enrutar el tráfico y gestionar la comunicación interna. 

La base de datos corre también en contenedores, lo que permite un escalado y una gestión más sencilla del almacenamiento, a lo cual tiene sus bases de replicas para una mayor accesibilidad de la información.

Finalmente, un Ingress o balanceador de carga recibe el tráfico externo y lo distribuye tanto a la aplicación frontal como a los servicios posteriores, garantizando alta disponibilidad y un enrutamiento eficiente.

## Monitoreo

Aquel se realiza con Prometheus y Grafana, que obtienen métricas de los nodos de kubernetes o de Next.js y de esta forma, se crean los monitores en Grafana, lo cual permite analizar y determinar nuevos procesos en la aplicación web.

## Docker-compose

1. Servicio Redis Ausente

Se agrega el servicio ```app_network``` al servicio, en el espacio de Redis.

2. Validación para Activación de la Base de Datos

Se agrega un healthy check al servicio de la base de datos para esperar que primero se valide que la base de datos este activa.

3. Configuración de la Contraseña de Redis

Se agrega una variable de entorno como una buena practica para la contraseña a la cual se accedia Redis.

4. Configuración del Volumen

Se agrega que el volumen ```pg_data``` se define con el controlador local.

5. Eliminación ```depends_on``` en Redis

Se elimina una dependencia de la base de datos en el bloque de Redis.

6. Restart en todos los servicios

Es de buena práctica agregar un reinicio en cada servicio. Se puede configurar acorde a los servicios que se deseen dar el reinicio, por si alguno esta fallando. También se podrian agregar logs internos del contenedor, y una vez dentro, validar la falla.

Recomendación: Se debe de tener cuidado a la hora de exponer los puertos, dado a que en algunas máquinas estos podrían estar siendo utilizados y se generaría conflictos.

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/basic-features/font-optimization) to automatically optimize and load Inter, a custom Google Font.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js/) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/deployment) for more details.
