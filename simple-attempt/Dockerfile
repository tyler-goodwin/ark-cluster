FROM steamcmd/steamcmd:latest

RUN apt-get update && apt-get install -y lib32gcc1 wget libsdl2-2.0-0:i386

# RUN ln -s /root/.steam/steamcmd/linux64/steamclient.so  /usr/lib/x86_64-linux-gnu/steamclient.so

RUN mkdir -p /app/ark
WORKDIR /app

COPY entrypoint.sh .

entrypoint ["./entrypoint.sh"]