FROM tomcat:8.0-alpine

LABEL maintainer="sdhah1999@gmail.com"

COPY target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
