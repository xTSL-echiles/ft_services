
CREATE DATABASE wordpress;
CREATE USER 'echiles'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON wordpress.* TO 'echiles'@'%';
FLUSH PRIVILEGES;