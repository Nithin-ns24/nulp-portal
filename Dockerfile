# Dockerfile for the player setup
FROM node:14.19.0-slim
RUN useradd -u 1001 -md /home/sunbird sunbird
WORKDIR /home/sunbird
COPY --chown=sunbird . /home/sunbird/app_dist/
RUN mkdir -p /home/sunbird/app_dist/tenant/sunbird
COPY src/app/tenant/sunbird/ /home/sunbird/app_dist/tenant/sunbird/
USER sunbird
WORKDIR /home/sunbird/app_dist
EXPOSE 3000
CMD ["node", "server.js", "&"]
