#!/bin/sh

cat << EOF > /etc/nginx/http.d/default.conf
server {
    listen 80;
    root /usr/share/nginx/html;

    location / {
        include /etc/nginx/mime.types;
        try_files \$uri \$uri/ /index.html;
    }

    location ~* \.(?:jpg|jpeg|gif|png|ico|svg)$ {
        expires 7d;
        add_header Cache-Control "public";
    }

    location ~* \.(?:css|js)$ {
        add_header Cache-Control "no-cache, public, must-revalidate, proxy-revalidate";
    }
}
EOF

exec nginx -g 'daemon off;'
nginx -t
