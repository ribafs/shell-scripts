#!/bin/bash
# yas com list
# Permite ao escolher uma pernonalista na lista e ver detalhes sobre ela na internet :-)
# Tem uma coluna com o nome e outra com a imagem da personalidade, se alguem
# copiar esse script, vai aparecer os nomes, mas não as imagens :-), pois elas no meu
# disco, é apenas um exemplo
show_list() {
ESCOLHIDO=$( \
yad --list \
--title="Detalhes sobre Personalidades" \
--column="ID":NUM \
--column="PERSONALIDADE":TEXT \
--column="FOTO":IMG \
--print-column=1 \
--hide-column=1 \
--width="300" \
--height="400" \
--button="Sair":1 \
--button="Ver detalhes":0 \
1 "rai3mb :-)" "myAvatar.png" \
2 "Linus Torvalds" "linus.png" \
3 "Richard Stallman" "stallman.png" \
4 "Mad Dog" "maddog.png" \
)
# ver se o usuário clicou em 'sair' or no 'x' da janela
ACAO="$?"
test "$ACAO" -eq "1" || test "$ACAO" -eq "252"
if [ "$?" -eq "0" ]; then
exit
fi
#captura apenas o numero da opcao selecionada
ESCOLHIDO=$(echo $ESCOLHIDO | egrep -o '^[0-9]')
# de acordo com a opcao selecionada, abre o firefox com detalhes da personalidade
case "$ESCOLHIDO" in
1)
firefox http://www.vivaolinux.com.br/perfil/verPerfil.php?login=rai3mb
show_list
;;
2)
firefox http://pt.wikipedia.org/wiki/Linus_Torvalds
show_list
;;
3)
firefox http://pt.wikipedia.org/wiki/Stallman
show_list
;;
4)
firefox http://pt.wikipedia.org/wiki/Jon_Hall
show_list
;;
*)
yad --image="face-angry" \
--title="Alerta" \
--text "Você não selecionou uma personalidade!" \
--button="Voltar e Selecionar"
show_list
;;
esac
}
show_list
#.EOF
