# To use this Dockerfile:
# 1. Build it: docker build -t mikexstudios/xcomic-docker .
# 2. Run it: docker run -d -p 80:80 mikexstudios/xcomic-docker
# 3. Access the docker container IP address in your web browser!
FROM yamamuteki/debian-etch-i386

RUN apt-get update

# Add some helper tools
RUN apt-get install -y vim screen wget unzip

# Set up a LAMP stack with PHP4.
# NOTE: mysql-server-4.1 is actually 5.x
RUN apt-get install -y apache2 php4 mysql-server-4.1 php4-mysql
RUN touch /etc/apache2/httpd.conf
RUN rm /etc/apache2/sites-enabled/000-default
COPY sites-enabled/app /etc/apache2/sites-enabled/app
RUN /etc/init.d/mysql start && echo "CREATE DATABASE app" | mysql -u root

# Set up Xcomic
WORKDIR /var/www
RUN wget --no-check-certificate https://github.com/mikexstudios/xcomic/releases/download/v0.8.3/Xcomic_0.8.3.zip -O Xcomic_0.8.3.zip && \
    unzip Xcomic_0.8.3.zip && \
    mv Xcomic_0.8.3/* . && \
    rmdir Xcomic_0.8.3 && \
    chmod 777 comics && \
    chmod 777 includes

# Run services
EXPOSE 80
CMD /etc/init.d/mysql start && apache2ctl -D FOREGROUND
