!/bin/bash
# uso do yad - com color
# permite selecionar determinada cor numa paleta de cores
# e envia o valor para a saída padrão, no caso armazenei na variável $COR
COR=$(\
yad --color \
--init-color="#FFFFFF" \ #cor que inicialmente fica selecionada na paleta de cores.
--palette \
)
yad --title="YAD COM COLOR" \
--text="Você selecionou a cor $COR"
#.EOF
