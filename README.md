# Laboratorio 02

### En este laboratorio se instalará Nginx en una imagen mediante **Dockerfile**
---
1. Se crea una carpeta, en este caso le pondré *Nginx*:
~~~
$ mkdir Nginx
~~~
2. Ingresando a la carpeta creada y dentro de ello crear el archivo *Dockerfile*:
~~~
$ cd Nginx
$ touch Dockerfile
~~~
3. Abrimos el archivo y dentro de ello ponemos lo siguiente:
~~~
$ vi Dockerfile

    FROM nginx:1.20.1
    COPY ./index.html /usr/share/nginx/html/index.html
    RUN apt install net-tools
    EXPOSE 80
~~~
>Se está instalando una versión estable de Nginx (1.20.1), luego se está copiando el archivo index.html creado hacia el directorio del servidor.
4. Se crea la imagen y se valida
~~~
$ docker build -t nginx:mario-v1 .

$ docker images
    REPOSITORY      TAG          IMAGE ID          CREATED             SIZE
    nginx           mario-v1     3bdbc93faad2      43 minutes ago      153MB
~~~
>Donde -t indica el tag (nombre) que se le está otorgando a la imagen. En este caso se le otorga el nombre de *nginx* y el tag *mario-v1*.
5. Se crea el contenedor
~~~
$ docker run -d -p 8080:80 -v ~/Nginx/index.html:/usr/share/nginx/html/index.html --name=mario-v1 nginx:mario-v1

    7856389d60595d538cc8c2a6af35d90a71c63478eb727a9e2710d1854f3260c6
~~~
>En la creación del contenedor ejecuto -d para que corra en background, -p para asignarle el puerto al servidor y -v para darle un volume y el archivo index pueda sincronizarce en caso se realicen algunos cambios.
6. Ejecutamos *docker ps* para tener detalle del contenedor
~~~
$docker ps
    CONTAINER ID   IMAGE            COMMAND                  CREATED         STATUS         PORTS                               NAMES
    7856389d6059   nginx:mario-v1   "/docker-entrypoint.…"   2 minutes ago   Up 2 minutes   0.0.0.0:81->80/tcp, :::81->80/tcp   mario-v1
~~~
