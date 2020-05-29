ARG NODE_IMAGE=node:10-alpine

FROM $NODE_IMAGE

RUN apk update && apk upgrade && apk add --no-cache tini bash git openssh
ENTRYPOINT ["/sbin/tini", "--"]

WORKDIR /code

COPY . /code

ADD run_app.sh /

RUN chmod +x /run_app.sh && npm install

EXPOSE 3000

USER node

CMD [ "npm" "start" ]
# CMD [ "./run_app.sh" ]