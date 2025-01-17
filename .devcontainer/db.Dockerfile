FROM mariadb:10.3.32-focal

# additional mysql conf properties
COPY db-context/mariadb.cnf /etc/mysql/mariadb.conf.d

# base database
ADD db-context/alkabor_2024-02-03-09_34.tar.gz /docker-entrypoint-initdb.d
ADD db-context/tblloginserversettings.sql /docker-entrypoint-initdb.d
# takp .tar contains this, dont want it to run
RUN rm /docker-entrypoint-initdb.d/drop_system.sql

# extra sql scripts
ADD db-context/auto_create_login.sql /docker-entrypoint-initdb.d/z_auto_create_login.sql
ADD db-context/launcher_boats.sql /docker-entrypoint-initdb.d/z_launcher_boats.sql