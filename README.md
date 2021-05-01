# client

// docker-compose.yaml

version: '3'
services:
db:
image: postgres
volumes: - db:/var/lib/postgresql/data
ports: - '6000:5432'
environment: - POSTGRES_HOST_AUTH_METHOD=trust
api:
build: ./api
command: bash -c "rm -f /api/tmp/pids/server.pid && foreman start -f /api/Procfile"
environment: - PORT=7001
volumes: - ./api:/api - rails_log:/api/log
ports: - '7000:7001'
depends_on: - db
client:
build: ./client
ports: - '8000:8001'
volumes: - ./client:/client - client_node_modules:/client/node_modules
volumes:
db:
rails_log:
client_node_modules:

docker-compose down -v

docker-compose up -d --build

docker-compose run api rails db:create

## Project setup

```
yarn install
```

### Compiles and hot-reloads for development

```
yarn serve
```

### Compiles and minifies for production

```
yarn build
```

### Run your unit tests

```
yarn test:unit
```

### Run your end-to-end tests

```
yarn test:e2e
```

### Lints and fixes files

```
yarn lint
```

### Customize configuration

See [Configuration Reference](https://cli.vuejs.org/config/).
