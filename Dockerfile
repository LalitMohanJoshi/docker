FROM node:16
# Create app directory
WORKDIR /var/www/html/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm install
# Bundle app source
COPY . .
EXPOSE 3000
# run node application
CMD [ "npm" , "start"]