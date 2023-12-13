# Setting up the postgres database
## 1.  Intall the postgres database
```
bash scripts/postgres.sh
```
## 2. Create a database
### Move to postgres directory
```
cd ~postgres
```
### acess the psl commandline for interaction with the database
```
sudo -u postgres psql
```
```
create database khnc
```
### 3. create tables of the database from psql file while connected to khnc
```
\i create-tables.sql
```
### 4. Insert data to the database from psql file
```
\i  insert.sql 
```
### 5. Create role and give CRUDE privillages
Create role in PSQL
```
create role user login password 'password';
```
### 6. Make the user superuser
```
alter role user superuser;
```
### Add connection credentials to .env file for secure connection

DATABASE_URL = "postgresql://YourUserName:YourPassword@localHost:5432/khnc";

## Dump data from datbase to one SQL
pg_dump -U user -d database_user > my_database_backup_august.sql



