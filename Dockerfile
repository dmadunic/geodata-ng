# Defining nginx image to be used
FROM nginx:1.15-alpine AS geodata-ngi
# Copying compiled code and nginx config to different folder
# NOTE: This path may change according to your project's output folder 
COPY  ./build/resources/main/static /usr/share/nginx/html
COPY ./docker/nginx/site.conf.template /etc/nginx/conf.d/site.conf.template

COPY ./docker/docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
# Exposing a port, here it means that inside the container 
# the app will be using Port 80 while running
EXPOSE 80
