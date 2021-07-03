#!/bin/bash
# yas com file
# permite selecionar um arquivo/diretório através de caixa de diálogo
# retorna o caminho do arquivo/diretório, deixando a nós o critério de fazer
# o que quiser com ele, nesse caso só vou mostrar o tamanho
ARQUIVO=$(\
yad --file \
--directory \
--title="Selecione um diretório para ver seu tamanho" \
--width="500" \
--height="300" \
)
TAMANHO=$(du -sh $ARQUIVO | cut -d"/" -f 1)
yad --title="Tamanho do diretório" \
--text="Tamanho do diretório $ARQUIVO = $TAMANHO" \
--width="400" \
--height="100" \
--button=gtk-ok:0
# a opcao button=gtk-ok:0 - mostra apenas o botao de ok no dialog
# e seu código de retorno é 0 (zero)
#.EOF
