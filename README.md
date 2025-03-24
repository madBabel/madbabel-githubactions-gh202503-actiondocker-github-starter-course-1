## Objetivo
Explorar cómo configurar una acción personalizada de Docker en GitHub Actions.

El objetivo de nuestra acción personalizada de Docker es ejecutar un Saludo por consola en un contenedor Docker  abstraer eso detrás de una acción reutilizable fácil de usar.

## Tareas

1. En la carpeta .github/actions/hello-to-you-docker alojaremos todos los archivos para nuestra acción personalizada de Docker.
2. modificar el archivo llamado action.yaml de la carpeta .github/actions/hello-to-you-docker y añadir las siguientes propiedades:
   - Un 'name' de Hello to You Docker;
   - Un 'description' de "Prints a greeting message in a Docker container";
   - La acción debería recibir un input:
     - El primero, llamado 'name', debería ser requerido, tener un description 'Your name', y por defecto ser 'World'.
   - Añadir una key 'runs' a nivel de workflow. Esta es la clave principal para definir nuestra acción personalizada en Docker. Para una acción personalizada en Docker, la key 'runs' tiene la siguiente forma:
   ```yaml
   runs:
     using: docker
     image: Dockerfile
   ```
   donde:
        - 'using: docker' define que la acción se ejecutará usando Docker.
        - 'image: <Dockerfile o imagen>' define qué archivo se usará para construir la imagen Docker, o qué imagen se usará para la ejecución.
4. Revisar el  archivo Dockerfile y entrypoint.sh en la carpeta .github/actions/hello-to-you-docker. 

5. Añadir los siguientes desencadenantes con filtros de eventos y tipos de actividad al flujo de trabajo:
    - workflow_dispatch: además, el desencadenador workflow_dispatch debería recibir un input, llamado name, de tipo string y con un valor por defecto de 'World'.
6. El step llamado HelloToYou, debería usar la acción personalizada de Docker creada en pasos anteriores. Para hacer referencia a una acción personalizada creada en el mismo repositorio que el flujo de trabajo, 
7. Confirmar los cambios y hacer push del código. Desencadenar el flujo de trabajo desde la interfaz de usuario y tómate unos momentos para inspeccionar la salida de la ejecución del flujo de trabajo.

## Añadir parámetros de salida a la acción personalizada de Docker
8. Modificar el archivo action.yaml para la acción personalizada de Docker:
   - Añadir una key 'outputs' a nivel de acción. Esta es la clave principal para definir las salidas de nuestra acción personalizada.
   - Añadir una salida llamada time, con una descripción de 'The time we greeted you'.
9. revisar bien el script entrypoint.sh, y comprobar  que devuelve la hora actual en la salida de la acción (parámetro time), redirigiendo la variable de entorno GITHUB_OUTPUT al archivo de salida de GitHub.
10. Modificar el flujo de trabajo para capturar la salida de la acción personalizada de Docker, añadiendo un nuevo job, llamado Getthetime, que debería ejecutar el script de GitHub para capturar la salida de la acción personalizada de Docker, y mostrar la hora en la consola.
