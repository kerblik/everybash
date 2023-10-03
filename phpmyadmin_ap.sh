#!/bin/bash

echo "Jsi si jistý?"
echo "[y] ANO!"
echo "[n] NE!"
read choice

case "$choice" in
  y)
    ./phpmyadmin.sh
    ;;
  n)
    ./Main.sh
    ;;
  *)
    echo "Neplatná volba"
    ;;
esac
