--create role
DROP ROLE anonymous;
CREATE ROLE anonymous
LOGIN
password '1';

DROP ROLE customer_demo;
CREATE ROLE customer_demo
LOGIN 
password '123123';

DROP ROLE employee_demo;
CREATE ROLE employee_demo
LOGIN
password '123123';
--Create Group of roles
CREATE ROLE customer;
CREATE ROLE employee;
CREATE ROLE anonymous;
--Grant
GRANT SELECT
ON products
TO customer;

GRANT customer TO customer_demo;

REVOKE all
ON products
FROM customer;

-- list all user
SELECT usename AS role_name
FROM pg_catalog.pg_user
ORDER BY role_name desc;