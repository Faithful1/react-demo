FROM node:10-alpine

RUN apk update && apk upgrade && apk add --no-cache tini bash git openssh
ENTRYPOINT ["/sbin/tini", "--"]

WORKDIR /code

ADD run_app.sh /

RUN chmod +x /run_app.sh

EXPOSE 3000

USER node

RUN npm run test

CMD [ "./run_app.sh" ]