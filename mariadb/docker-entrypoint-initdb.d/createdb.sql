CREATE DATABASE IF NOT EXISTS `app_db` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `app_user`.* TO 'app_db'@'%' IDENTIFIED BY 'app_password' ;

FLUSH PRIVILEGES ;
