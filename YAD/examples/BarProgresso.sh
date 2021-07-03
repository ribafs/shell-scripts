#!/bin/bash
# yad com --progress
# mostra uma barra de progresso para determinada ação, sendo que ler linha a linha
# dar entrada padrão
# neste exemplo busco arquivos .png na basta /home do usuário
find $HOME -name '*.png' | \
yad --progress \
--title "Progresso da busca" \
--width="300" \
--progress-text="Buscando imagens PNG" \
--pulsate \
--auto-close \
--auto-kill # mata o processo anterior caso usuario clique em cancelar
#.EOF
