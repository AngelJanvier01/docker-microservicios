# se inicia con una imagen temporal de ubuntu
FROM ubuntu:xenial AS builder

# se instalan las dependencias del framework flutter
RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get install -y curl \
    && apt-get install -y git \
    && apt-get install -y wget \
    && apt-get install -y unzip \
    && apt-get install -y libgconf-2-4 \
    && apt-get install -y gdb \
    && apt-get install -y libstdc++6 \
    && apt-get install -y libglu1-mesa \
    && apt-get install -y fonts-droid-fallback \
    && apt-get install -y python3 \
    && apt-get install -y psmisc \
    && apt-get clean

# se descarga el SDK de flutter
RUN git clone --progress --verbose https://github.com/flutter/flutter.git /usr/local/flutter

# se agrega el comando de ejecución flutter a la ruta principal
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# se verifica la instalación de flutter
RUN flutter doctor -v

# se copia el código del microservicio
COPY . /usr/local/bin/app

# se accede a la carpeta que contiene el código del microservicio
WORKDIR /usr/local/bin/app

# se descargan las dependencias del microservicio
RUN flutter pub get

RUN apt-get install -y git

# se compila la aplicación web
RUN flutter build web

# se instancia un servidor web para servir el app
FROM nginx

# copiamos el app compilada
COPY --from=builder /usr/local/bin/app/build/web /usr/share/nginx/html

# se expone el puerto que utilizará el microservicio
EXPOSE 80

# se ejecuta el servidor web
CMD ["nginx", "-g", "daemon off;"]
