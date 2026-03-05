#
# Docker image target for linting the markdown files.
#
FROM node:lts-alpine AS prettier
RUN npm init -y && npm install --save-dev --save-exact prettier
