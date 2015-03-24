FROM dockerfile/java
MAINTAINER Simon Koelsch <echox@echox.de>

RUN sudo apt-get update
ADD rzl-basement/target/basement-0.1.0-SNAPSHOT-standalone.jar /srv/basement.jar
EXPOSE 8080
CMD ["java", "-jar", "/srv/basement.jar"]
