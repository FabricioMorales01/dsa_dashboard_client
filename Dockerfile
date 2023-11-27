# Usar la imagen base oficial de Nginx con Git instalado
FROM nginx:alpine

# Instalar Git
RUN apk add --no-cache git

# Eliminar los archivos predeterminados de Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copiar la carpeta 'dist' al directorio de Nginx para contenido estático
COPY dist/ /usr/share/nginx/html/

# Copiar el archivo de configuración de Nginx personalizado
COPY default.conf /etc/nginx/conf.d/default.conf

# Copiar tu script de entrypoint
COPY entrypoint.sh /entrypoint.sh

# Asegúrate de que el script es ejecutable
RUN chmod +x /entrypoint.sh

# Exponer el puerto 80 para el tráfico HTTP
EXPOSE 80

# Usa tu script como el punto de entrada
ENTRYPOINT ["/entrypoint.sh"]
