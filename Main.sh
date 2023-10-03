#!/bin/bash

chmod +x apache_wp.sh
chmod +x basic_setup.sh
chmod +x php_pokracovani.sh
chmod +x phpmyadmin.sh
chmod +x phpmyadmin_ap.sh
chmod +x samba.sh


echo "Ahoj! Co by jsi chtěl nainstalovat?"
echo "[1] Základní nastavení"
echo "[2] Apache2 s WordPress"
echo "[3] phpMyAdmin"
echo "[4] Samba"
read choice

case "$choice" in
  1)
    ./basic_setup_ap.sh
    ;;
  2)
    ./apache_wp.sh
    ;;
  3)
    ./phpmyadmin_ap.sh
    ;;
  4)
    ./samba.sh
    ;;
  *)
    echo "Neplatná volba"
    ;;
esac
