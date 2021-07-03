#!/bin/bash
# yad com --scale
# neste exemplo uso o scale para permitir escolher o tamanho da imagem numa pagina html
#armazena o valor escolhido na escala
VALOR=$(\
yad --scale \
--title="Escolha o tamanho da imagem" \
--value="100" \
--min-value="100" \
--max-value="500" \
--step="50" \
)
#grava o conteúdo a ser gravado em uma pagina html com o tamanho da imagem escolhido
CONTEUDO="Vux
Todos os direitos reservados ao VOL :$
echo $CONTEUDO > scale.htm
#abre o arquivo no firefox
firefox scale.htm
#.EOF
