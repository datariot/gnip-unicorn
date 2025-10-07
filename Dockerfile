FROM nginx:alpine

# Create necessary directories and set permissions
RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx && \
    chown -R nginx:nginx /var/cache/nginx /var/run /var/log/nginx /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy static files
COPY UnicornRoulette.html /usr/share/nginx/html/index.html
COPY UnicornRoulette_files/ /usr/share/nginx/html/UnicornRoulette_files/

# Set proper permissions for copied files
RUN chown -R nginx:nginx /usr/share/nginx/html
