# Baixar um site completo. Já usei para baixar meu site criado em Joomla e converti para um site estático, que está aqui:
# https://ribafs.me/portal
wget \
     --recursive \
     -P /backup/github/public/ribafs \
     --page-requisites \
     --html-extension \
     --convert-links \
     --restrict-file-names=windows \
     --no-parent \
http://backup/ribafs

