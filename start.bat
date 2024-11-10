@echo off

REM Create data directory if it doesn't exist
IF NOT EXIST ".\data" (
    mkdir data
    echo Created 'data' directory for persistent storage.
)

REM Check if Docker image exists, build if it doesn't
docker image inspect fim-taller-env >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Docker image not found. Building the image...
    docker build -t fim-taller-env .
    IF %ERRORLEVEL% NEQ 0 (
        echo Docker build failed.
        exit /b %ERRORLEVEL%
    )
) ELSE (
    echo Docker image already exists. Skipping build.
)

REM Run the Docker container with persistent volume
docker run -it --rm -p 8888-8899:8888-8899 -v "%cd%\data:/home/taller" fim-taller-env
