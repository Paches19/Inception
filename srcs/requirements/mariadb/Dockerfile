FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server \
    mariadb-client \
    vim \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 3306

#Copy of the .sh and .sql in the /bin of the container to be able to run the program
# Give the right to execute + launch the .sh
COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT [ "sh", "/usr/local/bin/mariadb.sh" ]
