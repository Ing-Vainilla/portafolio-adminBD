FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=garcia-valdivia

# Declaración explícita de volumen
VOLUME ["/var/lib/mysql"]
COPY garcia-valdivia.sql /docker-entrypoint-initdb.d/
EXPOSE 3306 