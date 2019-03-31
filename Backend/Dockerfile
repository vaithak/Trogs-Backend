FROM node:carbon
RUN mkdir -p /usr/src
WORKDIR /usr/src
COPY package.json package-lock.json ./
RUN npm install
COPY app.js auth.js config.js connection.js ./
COPY models/ ./models/ 
COPY routes/ ./routes/
CMD ["node", "app.js"]
EXPOSE 8080