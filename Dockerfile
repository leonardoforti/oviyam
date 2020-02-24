FROM tomcat:latest

ENV ovi_ver 2.7.3
ENV iovi_ver 2.1

RUN apt-get install unzip

WORKDIR  /ovitmp

ADD https://iweb.dl.sourceforge.net/project/dcm4che/Oviyam/${ovi_ver}/Oviyam-${ovi_ver}-bin.zip oviyam.zip
ADD https://iweb.dl.sourceforge.net/project/dcm4che/Oviyam/iOviyam%20${iovi_ver}/iOviyam-${iovi_ver}-bin.zip ioviyam.zip

RUN unzip oviyam.zip && unzip ioviyam.zip && \ 
    cp /ovitmp/Oviyam-${ovi_ver}-bin/Oviyam-${ovi_ver}-bin/oviyam2.war /usr/local/tomcat/webapps/ROOT.war && \
    cp /ovitmp/Oviyam-${ovi_ver}-bin/tomcat/*.jar /usr/local/tomcat/lib && \
    cp /ovitmp/iOviyam-${iovi_ver}-bin/ioviyam2.war /usr/local/tomcat/webapps/ioviyam2.war
    
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
