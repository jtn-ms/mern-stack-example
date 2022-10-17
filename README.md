# mern-stack-example
Example Project on how to create MERN Stack
### Proxy settings
- ui/package.json
```json
"proxy": "http://mern-api:3080",
```
- docker-compose.yaml
```yml
  api:
   container_name: mern-api
```