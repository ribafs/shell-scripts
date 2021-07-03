#!/bin/bash
# yad com font
# mostra um diálogo de seleção de fonte
# retorna o nome da fonte selecionada e tamanho selecionado, gravando num html
RESULTADO=$(\
yad --font \
--fontname="Ubuntu",14 \
--preview="Texto para exemplo do uso de fonte yad é 10 :-) " \
--title="Selecione uma fonte" \
)
# usa expressão regular para pegar apenas o texto
FONTE=$(echo $RESULTADO | grep -o '[[:alpha:]]*')
# usa expressão regular para pegar apenas o tamanho da fonte, 2 digitos
TAMANHO=$(echo $RESULTADO | egrep -o '[0-9]{2}')
# grava o resultado num arquivo html para fazer um teste um pouco útil :-)
echo "texto com a fonte $FONTE e TAMANHO $TAMANHO " > arq_teste.htm
# abre o firefox para fazer um teste
firefox file://$PWD/arq_teste.htm
#.EOF
