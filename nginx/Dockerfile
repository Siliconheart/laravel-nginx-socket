FROM nginx:alpine

# Add user for nginx
#RUN groupadd -g 1000 www
#RUN useradd -u 1000 -g www www
RUN addgroup -g 1000 www
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup www \
    --no-create-home \
    --uid 1000 \
    www
RUN sed -i 's/user  nginx/user  www/g' /etc/nginx/nginx.conf
