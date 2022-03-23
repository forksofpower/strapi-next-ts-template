FROM node:16-alpine as runtime

RUN apk update

# Create build directory
WORKDIR /build-dir


# Install dependencies
COPY package.json yarn.lock .yarnrc.yml ./
COPY apps/api/package.json ./apps/web/package.json
COPY .yarn ./.yarn


RUN yarn set version self
RUN yarn install

COPY . .

# Build
RUN yarn workspace api build

ENV NODE_ENV production

# Will be overwritten by docker-compose
CMD ["yarn", "workspace", "api", "start"]