#!/bin/bash

echo "Prosím, zadejte heslo SuperUsera"

echo "Aktualizuji systém..."
sudo apt update && sudo apt upgrade -y

echo "Instaluji nano..."
sleep 1
sudo apt install nano -y

echo "Instaluji Midnight Commander (mc)..."
sleep 1
sudo apt install mc -y

echo "Instaluji wget..."
sleep 1
sudo apt install wget -y

echo "Instaluji git..."
sleep 1
sudo apt install git -y

echo "Instaluji tar..."
sleep 1
sudo apt install tar -y

echo "Instalace dokončena."
sleep 2
sudo su