FROM python:3.6.12-alpine3.12

RUN mkdir /data

RUN mkdir /job

ADD . /job

WORKDIR /job

RUN pip install -r requirements.txt

RUN crontab crontab

CMD ["crond", "-f"]