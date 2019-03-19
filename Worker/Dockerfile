FROM python:3
RUN mkdir -p /usr/src
WORKDIR /usr/src
COPY worker.py config.ini ./
RUN pip install pika
RUN pip install bson
RUN pip install configparser
RUN pip install pymongo
CMD [ "python", "./worker.py" ]