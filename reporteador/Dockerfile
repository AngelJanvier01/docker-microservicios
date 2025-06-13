# se inicia con una imagen de python
FROM python:3-bullseye

# instalar dependencias para algunos paquetes de python 
RUN apt-get update --allow-insecure-repositories -y && \
    apt-get install -y --no-install-recommends \
    libpango-1.0-0 \
    libpangoft2-1.0-0 \
    libpangocairo-1.0-0 \
    libharfbuzz-dev \
    libharfbuzz-bin \
    libgtk-3-0 \
    libcairo2 \
    libcairo2-dev \
    weasyprint && \
    rm -rf /var/lib/apt/lists/*

# se crea la carpeta que contendrá el código
RUN mkdir /reporter

# se copia el código del microservicio dentro de la carpeta creada
ADD . /reporter

# se mueve a la carpeta creada
WORKDIR /reporter

# se instalan las dependencias del microservicio
RUN pip install -r requirements.txt

# se expone el puerto que utilizará el microservicio
EXPOSE 8002

# se ejecuta el microservicio
CMD ["python", "main.py"] 

