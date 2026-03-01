FROM node:18

RUN apt-get update && apt-get install -y \
    ffmpeg \
    imagemagick \
    webp && \
    apt-get clean

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .


CMD ["npm", "start"]
