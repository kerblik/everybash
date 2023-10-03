#!/bin/bash

echo "Prosím, zadejte heslo SuperUsera"

echo "Aktualizuji systém..."
sudo apt update && sudo apt upgrade -y

echo "Instaluji apache2..."
sleep 1
sudo apt install apache2 -y

echo "Povoluji apache2..."
sleep 1
sudo systemctl enable --now apache2

echo "Instaluji php..."
sleep 1
sudo apt -y install wget php php-cgi php-mysqli php-pear php-mbstring libapache2-mod-php php-common php-phpseclib php-mysql

echo "Instaluji mariadb-server..."
sleep 1
sudo apt install mariadb-server -y


echo "Povoluji mariadb..."
sleep 1
sudo systemctl enable --now mariadb

echo "konfiguruji mysql..."
sleep 1
echo "1) heslo roota
2) y
3) n
4) y
5) y
6) y
7) y
"
sudo mysql_secure_installation

sleep 2

echo "konfiguruji mysql..."
echo "prosím zadejte zde tyto commandy:"
echo "CREATE USER 'USERID'@localhost IDENTIFIED BY 'PASSW0RD';"
echo "GRANT ALL PRIVILEGES ON *.* TO 'USERID'@localhost IDENTIFIED BY 'PASSW0RD';"
echo "FLUSH PRIVILEGES;"
echo "exit;"
sudo mysql
sleep 1

echo "Stahuji wordpress..."
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz

sleep 1

echo "Extrahuji WP"
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
sleep 3

echo "Extrahuji PHPMYADMIN"
sudo tar xvf phpMyAdmin-latest-all-languages.tar.gz
sleep 3
sudo mv phpMyAdmin-*-all-languages/ /var/www/html/phpmyadmin
sleep 4

cd /var/www/html
sleep 3
echo "konfiguruji phpMyAdmin"
sleep 3
sudo cp phpmyadmin/config.sample.inc.php phpmyadmin/config.inc.php
sudo mkdir /var/www/html/phpmyadmin/tmp

echo "Přidávám text"
echo "\$cfg['TempDir'] = '/var/www/html/phpmyadmin/tmp';" | sudo tee -a /var/www/html/phpmyadmin/config.inc.php > /dev/null

echo "dávám práva..."
sudo chown -R www-data:www-data /var/www/html/phpmyadmin

echo 'Alias /phpmyadmin /var/www/html/phpmyadmin' | sudo tee /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '<Directory /var/www/html/phpmyadmin/>' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '   AddDefaultCharset UTF-8' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '   <IfModule mod_authz_core.c>' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '      <RequireAny>' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '         Require all granted' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '      </RequireAny>' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '   </IfModule>' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '</Directory>' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '<Directory /var/www/html/phpmyadmin/setup/>' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '   <IfModule mod_authz_core.c>' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '      <RequireAny>' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '         Require all granted' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '      </RequireAny>' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '   </IfModule>' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null
echo '</Directory>' | sudo tee -a /etc/apache2/sites-available/phpmyadmin.conf > /dev/null

sudo a2enconf phpmyadmin.conf

sudo systemctl restart apache2


echo "Heslo na phpmyadmin je: PASSW0RD a jméno je: USERID"
echo "Instalace částečná prosím přidejte tento kód do /var/www/html/phpmyadmin/config.inc.php"
sleep 3
openssl rand -base64 32
sleep 1
sudo su