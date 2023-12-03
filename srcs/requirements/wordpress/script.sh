service php8.2-fpm start
sleep 1
sed -i -r "s/\/run\/php\/php8.2-fpm.sock/9000/1"   /etc/php/8.2/fpm/pool.d/www.conf
sleep 10

mkdir -p /var/www/wordpress
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/wordpress
wp core download --allow-root
sleep 5
cp wp-config-sample.php  wp-config.php
sed -i -r "s/database_name_here/$SQLDB/1"   wp-config.php
sed -i -r "s/username_here/$SQLUSER/1"  wp-config.php
sed -i -r "s/password_here/$SQLPASS/1"    wp-config.php
sed -i -r "s/localhost/mariadb/1"    wp-config.php
wp core install --url="$WP_URL" \
                --title="$WP_TITLE" \
                --admin_user="$WP_ADMIN" \
                --admin_email="$WP_ADEMAIL" \
                --admin_password="$WP_ADPASS" --allow-root
wp user create "$WP_USER" "$WP_USEMAIL" --role=contributor --user_pass="$WP_USPASS" --allow-root
/usr/sbin/php-fpm8.2 -F
