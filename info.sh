#!/bin/bash
# Script Exercice TP 07 S1
# Usage : ./info.sh
# Aloïs GAUCHER

while [[ $nom == '' ]]
do
	echo "Quel est votre nom?"
	read nom
done

while [[ $prenom == '' ]]
do
	echo "Quel est votre prenom?"
	read prenom
done

while [[ $vmid == '' ]]
do
	echo "Quel est votre vmid?"
	read vmid
done

if [ -f vmid.txt ]
then
	echo 'Le fichier vmid.txt existe déjà!'
	exit
else
	printf "%s\n" "VMID $vmid" "NOM: $nom" "PRENOM: $prenom" > vmid.txt
fi