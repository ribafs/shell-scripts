#!/bin/bash
# yad com --entry
# recebe valores e armazena em variáveis
NOME=$(\
yad --entry \
--entry-label="Nome" \
--entry-text="seu nome aqui" \
--completion \
--editable \
--title="USO DO YAD COM --entry" \
--width="300" \
)
SENHA=$(\
yad --entry \
--entry-label="Senha" \
--entry-text="123456" \
--completion \
--editable \
--hide-text \#senha – esconde o texto digitado apresentando apenas um “.” ponto
--title="USO DO YAD COM --entry" \
--width="300" \
)
yad --title="YAD COM --entry" \
--text="Nome: $NOME, Senha: $SENHA" \
--width="300" \
--height="100"
#.EOF
