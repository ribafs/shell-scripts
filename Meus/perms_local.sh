find $1 -type d -exec chmod 755 {} \;
find $1 -type f -exec chmod 654 {} \;
chown -R ribafs:ribafs $1;

