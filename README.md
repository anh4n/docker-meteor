# docker-meteor

Production Dockerimage with Meteor

## Building your Meteor app

Run the following command in the root directory of your meteor app, to build and generate an archive:

    docker run --rm -v $(pwd):/app anh4n/meteor build /app

Sometimes `meteor build` get stuck at downloading `meteor-tools`. If this happen, you can try the following command, to build your app, which helped me:

    docker run --rm -v $(pwd):/app --add-host warehouse.meteor.com:54.192.225.217 anh4n/meteor build /app

## Example Dockerfile of your meteor app

    FROM node:0.10.43

    ENV ROOT_URL http://localhost
    ENV PORT 3000

    # the generated archive is added and unpacked
    ADD ./app.tar.gz /app

    WORKDIR /app/bundle/programs/server

    RUN npm install

    EXPOSE 3000

    CMD [ "node", "/app/bundle/main.js" ]

## Example docker-compose.yml configuration

    version: '2'

    services:
        my_service:
            build: .
            ports:
                - "3000:3000"
            environment:
                - MONGO_URL=mongodb://example.com:27017/mycollection
            
