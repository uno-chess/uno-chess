### Create builder
FROM node:16-bullseye as builder
WORKDIR /usr/src/builder

# Install rustup & wasm-pack
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
ENV PATH="/root/.cargo/bin:${PATH}"

# Copy all source code
COPY uno-chess-website chess-website
COPY uno-chess-core chess

# Install and run build
WORKDIR /usr/src/builder/chess-website/server
RUN npm install
RUN npm run build


### Create server
FROM node:18-alpine
WORKDIR /usr/src/server

# Move all server files
COPY --from=builder /usr/src/builder/chess-website/server .
RUN rm dist

# Move all public files
COPY --from=builder /usr/src/builder/chess-website/www/dist dist
RUN npm install

EXPOSE 80
CMD ["npm", "start"]
