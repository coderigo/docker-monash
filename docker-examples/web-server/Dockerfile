# An image for an NGINX web server
# based on : https://registry.hub.docker.com/_/nginx/
#
# Build the image with:
#   docker build --tag="docker-monash/nginx-img" --rm=true ./
# 
# Run a container in the background based on the image with:
#   docker run -d -p 80:80 --name="my-web-server" --hostname="my.web.server" docker-monash/nginx-img
# 
# Then point your web browser to the IP address reported by the following command:
#   echo $(echo $DOCKER_HOST | cut -d'/' -f3 | cut -d':' -f1)
#
# To clean up the container after it runs or finishes:
#   docker kill my-web-server && docker rm my-web-server

FROM nginx

COPY my-web-content /usr/share/nginx/html

