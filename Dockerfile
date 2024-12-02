FROM php:8.2-apache

# Instalar dependências do Laravel
RUN apt-get update && apt-get install -y \
    zip unzip git curl libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Copiar o script de inicialização
COPY init.sh /init.sh
RUN chmod +x /init.sh

# Copiar o código inicial do Laravel (app) para dentro da imagem
COPY ./app /var/www/html_backup

# Configurar o diretório de trabalho
WORKDIR /var/www/html

# Garantir permissões adequadas
RUN chown -R www-data:www-data /var/www/html /var/www/html_backup

# Usar o script de inicialização como comando padrão
CMD ["/init.sh"]
