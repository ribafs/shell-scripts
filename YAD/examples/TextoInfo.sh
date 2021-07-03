#!/bin/bash
# yad com --text-info
# exemplo para selecionar um arquivo e ver seu conteúdo (editá-lo se desejar)
ARQUIVO=$(\
yad --file \
--filename="$HOME/" \
--title="Selecione um arquivo" \
--width="500" \
--height="400" \
)
# testa se o usuário quer cancelou
ACAO="$?"
test "$ACAO" -eq "1" || test "$ACAO" -eq "252"
if [ "$?" -eq 0 ]; then
exit
fi
# filename - nome do arquivo, editable - permite edição, fore - cor do texto
# back - cor do fundo, fontname - fonte a ser usada, justify - alinhamento do texto
# margins - tamanho da margem, tail - barra de rolagem
MOD_ARQUIVO=$( \
yad --text-info \
--title="Visualizando o arquivo $ARQUIVO" \
--filename="$ARQUIVO" \
--editable \
--fore="#00FF00" \
--back="#000000" \
--fontname="Ubuntu" \
--justify="left" \
--margins="2" \
--tail \
--width="500" \
--height="400" \
--button="Cancelar":1 \
--button="Salvar":0 \
)
# testa se o usuário quer cancelou
ACAO="$?"
test "$ACAO" -eq "1" || test "$ACAO" -eq "252"
if [ "$?" -eq 0 ]; then
exit
fi
# salva as modificações no arquivo
echo $MOD_ARQUIVO \n > $ARQUIVO
#.EOF
