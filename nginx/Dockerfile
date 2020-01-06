FROM nginx:1.17.6
LABEL MAINTAINER="Jonas Cavalcanti <jonascavalcantineto@gmail.com> | Cicero Gadelha <cicerogadelha@gmail.com>"

RUN apt-get update -y
RUN apt-get install -y \
                    apache2-utils \
                    procps \
                    openssl \
                    supervisor

ADD conf/*	/etc/nginx/conf.d/

#Certificates definitions####################################
ENV SSL="false"
ENV CERTS_DIR="/etc/nginx/conf.d/certs"
#Country Name (2 letter code) [XX]
ENV COUNTRY="BR"
#State or Province Name (full name) []
ENV STATE="Ceará"
#Locality Name (eg, city) [Default City]
ENV LOCALITY="Fortaleza"
#Organization Name (eg, company) [Default Company Ltd]
ENV ORGANIZATION="mycompany"
#Organizational Unit Name (eg, section) []
ENV ORGANIZATIONALUNIT="IT"
#Common Name (eg, your name or your server's hostname) []   
ENV COMMON_NAME="myserver.domain.com"
#Email Address []
ENV EMAIL="admin@domain.com"
##########################################################

ENV FILE_PERMISSION_PATH="/etc/nginx/conf.d/access/"
ENV ADMIN_REGISTRY_USER=redhat
ENV ADMIN_RESGITRY_PASSWD=1q2w3e

ADD inits/supervisord.conf /etc/supervisord.conf

ADD scripts/certOpensslGenerator.sh /certOpensslGenerator.sh
RUN chmod +x /certOpensslGenerator.sh

ADD scripts/userApacheNginxGenarator.sh /userApacheNginxGenarator.sh
RUN chmod +x /userApacheNginxGenarator.sh

ADD inits/nginx.sh /nginx.sh
RUN chmod +x /nginx.sh

ADD inits/startd /startd
RUN chmod +x /startd

WORKDIR /etc/nginx/

CMD ["/startd"]