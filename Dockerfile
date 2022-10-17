# Stage1: UI Build
FROM node:16 AS ui-build
WORKDIR /usr/src
COPY ui/ ./ui/
RUN cd ui && npm install && npm run build

# Stage2: API Build
FROM node:16 AS api-build
WORKDIR /usr/src
COPY api/ ./api/
RUN cd api && npm install && ENVIRONMENT=test npm run build
RUN ls

# Stage3: Packaging the app
FROM node:16
WORKDIR /root/
COPY --from=ui-build /usr/src/ui/build ./ui/build
COPY --from=api-build /usr/src/api/dist .
RUN ls

EXPOSE 80

CMD ["node", "api.bundle.js"]