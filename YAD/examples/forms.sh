#!/bin/bash
# yad com FORMULARIOS, que bacana, tem algumas novidades aprecie com calma
HOJE=$(date +%d/%m/%Y)
touch $HOME/cad_usuario.txt
VAR_FORM=$( \
yad --form \
--title="CADASTRO DE USUÁRIOS" \
--width=400 \
--height=400 \
--image="accessories-text-editor" \
--field="Cadastrando em":RO "$HOJE" \
--field="Nome:" "" \
--field="Sexo":CB Masculino!Feminino \
--field="Login:" "$USER" \
--field="Senha:":H "123456"\
--field="Ler livro sobre:":RO "" \
--field="Programação":CHK FALSE \
--field="Redes":CHK FALSE \
--field="Linux":CHK TRUE \
--field="Quantos Filhos:":NUM 0!0..10!1 \
--field="Foto:":FL "$HOME/Pictures" \
--field="Salvar dados em:":DIR "$HOME" \
--field="Cor preferida:":CLR "#00DDDD" \
)
DATA=$(echo "$VAR_FORM" | cut -d"|" -f 1)
NOME=$(echo "$VAR_FORM" | cut -d"|" -f 2)
SEXO=$(echo "$VAR_FORM" | cut -d"|" -f 3)
LOGIN=$(echo "$VAR_FORM" | cut -d"|" -f 4)
SENHA=$(echo "$VAR_FORM" | cut -d"|" -f 5)
#notem que pulei o campo 6, pois o mesmo nao retorna valor útil para nós
LIVRO_PROGRAMACAO=$(echo "$VAR_FORM" | cut -d"|" -f 7)
LIVRO_REDES=$(echo "$VAR_FORM" | cut -d"|" -f 8)
LIVRO_LINUX=$(echo "$VAR_FORM" | cut -d"|" -f 9)
QTD_FILHOS=$(echo "$VAR_FORM" | cut -d"|" -f 10)
FOTO=$(echo "$VAR_FORM" | cut -d"|" -f 11)
SALVAR_EM=$(echo "$VAR_FORM" | cut -d"|" -f 12)
COR=$(echo "$VAR_FORM" | cut -d"|" -f 13)
# repare que o campo $QTD_FILHOS retorna um valor no formato 0.000000
# vc pode usar uma expressão regular, ou o cut, para capturar apenas os digitos antes do .
QTD_FILHOS=$(echo $QTD_FILHOS | cut -d"." -f 1)
#apenas vou mostrar os campos e valores de retorno em um html
DADOS_USUARIO="<table border=1><br/>
<tr><th>CAMPO</th><th>VALOR</th></tr>
<tr><td>DATA</td><td>$DATA</td></tr>
<tr><td>NOME</td><td>$NOME</td></tr>
<tr><td>SEXO</td><td>$SEXO</td></tr>
<tr><td>LOGIN</td><td>$LOGIN</td></tr>
<tr><td colspan=2 align=center>LIVROS</td></tr>
<tr><td>PROGRAMACAO</td><td>$LIVRO_PROGRAMACAO</td></tr>
<tr><td>REDES</td><td>$LIVRO_REDES</td></tr>
<tr><td>LINUX</td><td>$LIVRO_LINUX</td></tr>
<tr><td>QTD_FILHOS</td><td>$QTD_FILHOS</td></tr>
<tr><td>FOTO</td><td><img src='$FOTO' /></td></tr>
<tr><td>DIRETORIO</td><td>$SALVAR_EM</td></tr>
<tr><td>COR</td><td bgcolor='$COR'></td></tr>
</table>"
echo $DADOS_USUARIO > cad_usuario.htm
firefox cad_usuario.htm
#.EOF
