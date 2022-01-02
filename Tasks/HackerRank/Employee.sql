
/* Delimiter changed to ; */
/* Connecting to 127.0.0.1 via MariaDB or MySQL (TCP/IP), username root, using password: Yes ... */
SELECT CONNECTION_ID();
/* Characterset: utf8mb4 */
SHOW /*!50002 GLOBAL */ STATUS;
SELECT NOW();
SHOW VARIABLES;
/* Connected. Thread-ID: 22 */
SHOW TABLES FROM `information_schema`;
SHOW DATABASES;
SHOW OPEN TABLES FROM occupation WHERE `in_use`!=0;
USE `occupation`;
/* Entering session "Unnamed" */
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='occupation';
SHOW TABLE STATUS FROM `occupation`;
SHOW FUNCTION STATUS WHERE `Db`='occupation';
SHOW PROCEDURE STATUS WHERE `Db`='occupation';
SHOW TRIGGERS FROM `occupation`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='occupation';
USE `employees`;
SELECT `DEFAULT_COLLATION_NAME` FROM `information_schema`.`SCHEMATA` WHERE `SCHEMA_NAME`='employees';
SHOW TABLE STATUS FROM `employees`;
SHOW FUNCTION STATUS WHERE `Db`='employees';
SHOW PROCEDURE STATUS WHERE `Db`='employees';
SHOW TRIGGERS FROM `employees`;
SELECT *, EVENT_SCHEMA AS `Db`, EVENT_NAME AS `Name` FROM information_schema.`EVENTS` WHERE `EVENT_SCHEMA`='employees';
SELECT * FROM `information_schema`.`COLUMNS` WHERE TABLE_SCHEMA='employees' AND TABLE_NAME='employees' ORDER BY ORDINAL_POSITION;
SHOW INDEXES FROM `employees` FROM `employees`;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE   CONSTRAINT_SCHEMA='employees'   AND TABLE_NAME='employees'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SELECT * FROM information_schema.KEY_COLUMN_USAGE WHERE   TABLE_SCHEMA='employees'   AND TABLE_NAME='employees'   AND REFERENCED_TABLE_NAME IS NOT NULL;
SHOW ENGINES;
SHOW COLLATION;
SHOW CREATE TABLE `employees`.`employees`;
SELECT CONSTRAINT_NAME, CHECK_CLAUSE FROM `information_schema`.`CHECK_CONSTRAINTS` WHERE CONSTRAINT_SCHEMA='employees' AND TABLE_NAME='employees';
SHOW CHARSET;
SELECT 'employees' AS `Database`, 'employees' AS `Table`, 0 AS `Rows`, 0 AS `Duration`;
/*!40101 SET @OLD_LOCAL_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
