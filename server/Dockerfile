FROM node:alpine
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN ls -l /app
CMD ["npm","run","start"]