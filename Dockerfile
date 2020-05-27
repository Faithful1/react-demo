FROM node:10-alpine

RUN apk update && apk upgrade && apk add --no-cache tini bash git openssh
ENTRYPOINT ["/sbin/tini", "--"]

WORKDIR /code

EXPOSE 3000

USER node

CMD ["npm", "start"]
