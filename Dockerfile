FROM tomcat:7.0.91-jre7
ENV version_oviyam 2.7.4

RUN apt-get install unzip

WORKDIR /ovitmp

ADD https://iweb.dl.sourceforge.net/project/dcm4che/Oviyam/${version_oviyam}/Oviyam-${version_oviyam}-bin.zip oviyam.zip

RUN unzip oviyam.zip && \
    rm -R /usr/local/tomcat/webapps/ROOT/ && \
    cp /ovitmp/Oviyam-${version_oviyam}-bin/Oviyam-${version_oviyam}-bin/oviyam2.war /usr/local/tomcat/webapps/ROOT.war && \
    cp /ovitmp/Oviyam-${version_oviyam}-bin/tomcat/*.jar  /usr/local/tomcat/lib

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
