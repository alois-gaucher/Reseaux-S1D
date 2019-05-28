#!/bin/bash
# Script Exercice TP 08 S1
# Usage : ./autofstab.sh
# Aloïs GAUCHER

if [ -f /etc/fstab ]
then
	echo 'Le fichier /etc/fstab existe, super!'
	while [[ $vmid == '' ]]
	do
		echo "Quel est le VMID de la machine que vous voulez ajouter? (Syntaxe: VM.ID)"
		read vmid
		echo $vmid
	done
	ipvmid='172.16.'$vmid
	echo $ipvmid
	mkdir /partage$vmid && chmod 777 /partage$vmid
	printf "/n %s" "$ipvmid:/partage$vmid /partage$vmid nfs defaults,user,auto 0 0" >> /etc/fstab
	echo 'Le serveur a bien été ajouté!'
else
	exit
fi
