FROM node

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_ENV production

ADD dist /home/node/app/dist
ADD package.json /home/node/app/package.json
ADD package-lock.json /home/node/app/package-lock.json

ENV MONGODB_URI mongodb://rony:12345678@localhost:27017/smart_diary
ENV JWT_SECRET ashdfjhasdlkjfhalksdjhflak
ENV SALT_SECRET 8

RUN chown -R node:node /home/node/app 

USER node
WORKDIR /home/node/app
RUN npm install

EXPOSE 3000

#CMD node dist/server.js
CMD npm run watch
