FROM jenkins/jenkins:lts

#COPY jenkins2.sh /usr/local/bin/jenkins2.sh
#COPY download-and-check-updates.sh /usr/local/bin/download-and-check-updates.sh

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
#COPY config.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml

EXPOSE 8080
EXPOSE 50000
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["tini", "--", "/usr/local/bin/entrypoint.sh"]
