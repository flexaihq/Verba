FROM python:3.11
WORKDIR /Verba
COPY . /Verba
RUN pip install '.'

# add debug tools
RUN apt-get update && apt-get install -y vim net-tools

EXPOSE 8000
CMD ["verba", "start","--port","8000","--host","0.0.0.0"]
