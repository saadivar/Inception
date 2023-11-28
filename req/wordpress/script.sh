sleep 25

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/wordpress
sed -i -r "s/smiya/$SQLDB/1"   wp-config.php
sed -i -r "s/user/$SQLUSER/1"  wp-config.php
sed -i -r "s/pass/$SQLPASS/1"    wp-config.php
wp core install --url="$WP_URL" \
                --title="$WP_TITLE" \
                --admin_user="$WP_ADMIN" \
                --admin_email="$WP_ADEMAIL" \
                --admin_password="$WP_ADPASS" --allow-root
wp user create "$WP_USER" "$WP_USEMAIL" --role=contributor --user_pass="$WP_USPASS" --allow-root
/usr/sbin/php-fpm8.2 -F
