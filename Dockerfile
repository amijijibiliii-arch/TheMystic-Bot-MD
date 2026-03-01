FROM node:18

# Instalamos librerías necesarias para el bot
RUN apt-get update && apt-get install -y \
    ffmpeg \
    imagemagick \
    webp && \
    apt-get clean

WORKDIR /app

# Copiamos archivos y forzamos la instalación
COPY package.json .
RUN npm install

COPY . .

# ESTA LÍNEA ES LA CLAVE: 
# Obliga a mostrar la consola (donde sale el QR) y no una web
ENV PORT=7860
CMD ["npm", "start"]
