# PostgreSQL on kubernetes
PostgreSQL is an advanced object-relational database management system that supports an extended subset of the SQL standard, including transactions, foreign keys, subqueries, triggers, user-defined types and functions.

## Prerequisites

* PV provisioner support in the underlying infrastructure (Only when persisting data)

## Configuration
### Persistent Volume
Setup host path directory for Persistent Volume in file:
postgres-persistence.yml
```
Using rook-block storage class for provision psql storage
```
### Postgres
In `postgres-pod.yaml` you can find environment variables for Postgres configuration:

```
env:
  - name: DB_PASS
    value: password
  - name: PGDATA
    value: /var/lib/postgresql/data/pgdata
  - name: PGDATABASE
```

* DB_PASS - Password for the new user.
* PGDATABASE - Name for new database to create.
* PGUSER - Username of new user to create. Default `postgres`

The whole list with environment variables is here: https://www.postgresql.org/docs/9.3/static/libpq-envars.html

## Deployment

First create PV:

```
kubectl create -f postgres-persistence.yml -n postgres
```

Second create PVC:

```
kubectl create -f postgres-claim.yml -n postgres
```

Finally deploy service and Pod

```
kubectl create -f postgres-service.yml -n postgres
kubectl create -f postgres-pod.yml -n postgres

```

You can view pods

```
kubectl get pods -n postgres

```

kubectl get pods

Connect to the db

```
psql --host localhost --port 5432 postgres -U postgres

```

Create a test table and insert a row

```
postgres=# create table test (id int primary key not null, value text not null);
CREATE TABLE
postgres=# insert into test values (1, 'value1');
INSERT 0 1
postgres=# select * from test;
 id | value
----+--------
  1 | value1
(1 row)
```