# Contendedor de Docker para el Taller de Aniversario FIM-UMSNH 2024

## Instrucciones para Configurar el Entorno

Este proyecto permite configurar y ejecutar un entorno Docker con JupyterLab de forma rápida. Sigue estos pasos para asegurarte de que todo funcione correctamente.

### Requisitos Previos

Antes de comenzar, asegúrate de tener instalados los siguientes programas:

1. **Windows Terminal**: Necesario para ejecutar comandos en la terminal.
2. **Git**: Necesario para clonar el repositorio.
3. **Docker Desktop**: Necesario para ejecutar contenedores Docker.

### Instrucciones de Instalación

1. **Clonar el Repositorio**:
   - Ve al Escritorio, haz clic derecho y selecciona **Abrir en Windows Terminal**.
   - Clona el repositorio con el siguiente comando:

     ```bash
     git clone https://github.com/guillermoibarra/fim-docker-env-nov24.git ./taller
     ```

2. **Ejecutar el Script de Inicio**:
   - Navega al directorio raíz del proyecto recién clonado:

     ```bash
     cd taller
     ```

   - Ejecuta el archivo `start.bat` ejecutándolo en Windows Terminal. Esto configurará y ejecutará el contenedor Docker con el entorno necesario.

3. **Acceder a JupyterLab**:
   - Una vez que el contenedor esté en ejecución, podrás acceder a JupyterLab abriendo tu navegador y entrando a la URL que se mostrará en la terminal.

### Notas

- **Datos Persistentes**: Todos los datos guardados en el contenedor se almacenarán en la carpeta `data` del proyecto para que puedas acceder a ellos incluso si detienes el contenedor.

