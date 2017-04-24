FROM openjdk:8-jdk
EXPOSE 8047

RUN curl -O http://apache.mirrors.hoobly.com/drill/drill-1.10.0/apache-drill-1.10.0.tar.gz

RUN mkdir -p /opt/drill /opt/drill-storage
RUN tar -xvzf apache-drill-1.10.0.tar.gz --strip 1 -C /opt/drill

COPY drill-override.conf /opt/drill/conf/

COPY drill-config.tgz /tmp
RUN tar -xvzf /tmp/drill-config.tgz --strip 1 -C /opt/drill-storage

RUN mkdir -p /data/tsv /data/csv /data/json

CMD /opt/drill/bin/drill-embedded
