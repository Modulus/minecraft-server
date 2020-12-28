FROM openjdk:11.0.9.1-jre-buster

WORKDIR /opt/minecraft
#RUN chown -R nobody  /opt/minecraft
# USER nobody
RUN curl -LO https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar 

#&& chown nobody server.jar

EXPOSE 25565
# Must run to generate eula and such
RUN java -Xmx1024M -Xms1024M -jar server.jar nogui \
    && sed -i 's/false/true/' eula.txt \
    && cat eula.txt

ENTRYPOINT java -Xmx1024M -Xms1024M -jar server.jar nogui