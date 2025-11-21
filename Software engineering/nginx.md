# NGINX

Reloading:
```bash
sudo nginx -s reload
```

If you see `include /etc/nginx/modules-enabled/*.conf;` at the beginning of `nginx.conf` file, after each reloading, Nginx automatically loads every `.conf` file which are inside `/etc/nginx/conf.d`.

