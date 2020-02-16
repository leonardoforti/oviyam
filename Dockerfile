FROM tomcat:latest

ENV version 2.7.3

RUN apt-get install unzip

WORKDIR  /ovitmp

ADD https://iweb.dl.sourceforge.net/project/dcm4che/Oviyam/${version}/Oviyam-${version}-bin.zip oviyam.zip 

RUN unzip oviyam.zip && \ 
    rm -R /usr/local/tomcat/webapps/ROOT/ && \
    cp /ovitmp/Oviyam-${version}-bin/Oviyam-${version}-bin/oviyam2.war /usr/local/tomcat/webapps/ROOT.war && \
    cp /ovitmp/Oviyam-${version}-bin/tomcat/*.jar  /usr/local/tomcat/lib
    
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
