#!/bin/bash
clear
echo ========= Agenda de Telefones e E-mails - Ribamar FS =========
echo ========= Escolha a Op��o =========
echo ========= a - Adicionar registros ==========
echo ========= c - Listar a Agenda ==========
echo ========= s - Sair ==========
read opcao
if [ $opcao = "a" ]; then
	echo Entre o nome 
	read nome
	echo Entre com o e-mail
	read email
	echo Entre com o telefone ou ramal
	read telefone
	echo "$nome - $email - $telefone" >> agenda.txt
	less agenda.txt
elif [ $opcao = "c" ]; then
	less agenda.txt
elif [ $opcao = "s" ]; then
	clear
	exit 0
fi
