FROM node:16-alpine as runtime

RUN apk update

# Create app directory
WORKDIR /build-dir


COPY package.json yarn.lock ./
COPY apps/api/package.json ./apps/web/package.json

# Install app dependencies
COPY .yarn ./.yarn
COPY .yarnrc.yml yarn.lock ./
RUN yarn set version self
RUN yarn install --immutable --silent

# Bundle App Src
COPY . .

# Build
RUN yarn workspace api build

ENV NODE_ENV production


# Will be overwritten by docker-compose
CMD ["yarn", "workspace", "api", "start"]