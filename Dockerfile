FROM openjdk:8u151-jre

ENV PDIBRANCH=9.0
ENV PDIVERSION=9.0.0.0-423

RUN sh -c "cd /opt && curl -JLO https://sourceforge.net/projects/pentaho/files/Pentaho%20$PDIBRANCH/client-tools/pdi-ce-$PDIVERSION.zip/download" \
  && unzip /opt/*.zip -d /opt \
  && rm /opt/*.zip \
  && rm -r /opt/data-integration/ADDITIONAL-FILES \
  && rm -r /opt/data-integration/docs \
  && rm -r /opt/data-integration/samples

RUN curl -JLO "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.48.tar.gz" \
  && tar -zxvf mysql-connector-java-5.1.48.tar.gz \
  && cp mysql-connector-java-5.1.48/mysql-connector-java-5.1.48-bin.jar /opt/data-integration/lib/ \
  && rm mysql-connector-java-5.1.48.tar.gz \
  && rm -r mysql-connector-java-5.1.48
 
RUN apt-get update && apt-get -y install jq && apt-get install python-pip -y && pip install awscli
