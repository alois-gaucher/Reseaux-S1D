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
	if [ -f /partage$vmid ]
		then
			echo 'Le dossier existe déjà, on passe cette étape'
		else
			mkdir /partage$vmid && chmod 777 /partage$vmid
	fi
	printf "%s\n" "$ipvmid:/partage$vmid /partage$vmid nfs defaults,user,auto 0 0" >> /etc/fstab
	echo 'Le serveur a bien été ajouté!'
	echo 'Montage en cours...'
	mount -a
else
	touch /etc/fstab
	echo 'Fichier /etc/fstab créé, relancez le script!'
	exit
fi
