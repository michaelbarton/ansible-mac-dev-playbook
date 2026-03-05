#
# Docker image target for linting the markdown files.
#
FROM node:lts-alpine AS prettier
WORKDIR /app
RUN npm cache clean --force && npm init -y && npm install --save-dev --save-exact prettier
