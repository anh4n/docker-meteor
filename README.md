# docker-meteor

Dockerimage with Meteor

## Development

### Example docker-compose.yml configuration

    version: '2'

    services:
        my_service:
            image: anh4n/meteor
            ports:
                - "3000:3000"
            volumes:
                - ./:/app
            environment:
                - MONGO_URL=mongodb://example.com:27017/mycollection

## Production

### Building your Meteor app

Run the following command in the root directory of your meteor app, to build and generate an archive:

    docker run --rm -v $(pwd):/app anh4n/meteor build /app

### Example Dockerfile of your meteor app

    FROM node:8.11.3

    ENV ROOT_URL http://localhost
    ENV PORT 3000

    # the generated archive is added and unpacked
    ADD ./app.tar.gz /app

    WORKDIR /app/bundle/programs/server

    RUN npm install

    EXPOSE 3000

    CMD [ "node", "/app/bundle/main.js" ]

### Example docker-compose.yml configuration

    version: '2'

    services:
        my_service:
            build: .
            ports:
                - "3000:3000"
            environment:
                - MONGO_URL=mongodb://example.com:27017/mycollection
            
