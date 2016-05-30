FROM yamamuteki/debian-etch-i386

RUN apt-get update

# Add some helper tools
RUN apt-get install vim screen wget

# Set up a LAMP stack with PHP4.
# NOTE: mysql-server-4.1 is actually 5.x
RUN apt-get install -y apache2 php4 mysql-server-4.1 php4-mysql
RUN echo "CREATE DATABASE xcomic" | mysql -u root

# Set up Xcomic
WORKDIR /var/www
RUN wget http://downloads.sourceforge.net/xcomic/Xcomic_0.8.3.zip && \
    unzip Xcomic_0.8.3.zip && \
    cd Xcomic_0.8.3 && \
    chmod 777 comics && \
    chmod 777 includes

# Run services
EXPOSE 80
CMD /etc/init.d/mysql start && apache2ctl -D FOREGROUND
