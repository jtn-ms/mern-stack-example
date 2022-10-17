# nodejs-restapi-mongo
Example Project on how to build and develop REST API with NodeJS and MongoDB

## LocalHost Testing Setup
```
[mongo]
docker run -d  --name mongo-db -p 27017:27017 mongo

[.env]
MONGO_URL=mongodb://localhost:27017/

[frontend]
cd ../ui
npm run build

[server.js]
'./ui/build' => '../ui/build'
'./ui/build/index.html' => '../ui/build/index.html'

[run]
ENVIRONMENT=test npm run dev
```

#### Docker Tips
```
[default]
docker run -d  --name mongo-db -p 27017:27017 mongo

[with password]
docker run -d  --name mongo-db -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=example mongo
```
