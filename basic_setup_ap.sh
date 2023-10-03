#!/bin/bash

echo "Jsi si jistý?"
echo "[y] ANO!"
echo "[n] NE!"
read choice

case "$choice" in
  y)
    ./basic_setup.sh
    ;;
  n)
    ./Main.sh
    ;;
  *)
    echo "Neplatná volba"
    ./Main.sh
    ;;
esac
