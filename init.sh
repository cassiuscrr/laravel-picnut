#!/bin/bash

# Verificar se o volume está vazio
if [ ! "$(ls -A /var/www/html)" ]; then
  echo "O volume está vazio. Copiando arquivos iniciais..."
  cp -R /var/www/html_backup/* /var/www/html
  chown -R www-data:www-data /var/www/html
else
  echo "O volume já contém arquivos. Nada será copiado."
fi

# Iniciar o Apache
apache2-foreground
