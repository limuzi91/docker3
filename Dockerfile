# Build Phase
# Specify a base image
FROM node:alpine as builder

# Specify a working directory inside container
WORKDIR '/app'

# Only install dependencies if there's change with package.json file 
COPY ./package.json ./
RUN npm install

# Copy all files into container
COPY ./ ./

# Default command
RUN npm run build



# Run Phase
# Specify a base image
FROM nginx

# Copy something from different Phase
COPY --from=builder /app/build /usr/share/nginx/html

# Default command
# Nginx will take care of it automatically