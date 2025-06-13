# se inicia con la imagen de python
FROM python:3.8-alpine

# se crea la carpeta que contendrá el código
RUN mkdir /notifier

# se copia el código del microservicio dentro de la carpeta creada
ADD . /notifier

# se mueve a la carpeta creada
WORKDIR /notifier

# se instalan las dependencias del microservicio
RUN pip install -r requirements.txt

# se expone el puerto que utilizará el microservicio
EXPOSE 8001

# se ejecuta el microservicio
CMD ["python", "main.py"]