# Nginx

### Proxy pass
proxy_pass directive is used to pass the proxied request . 

```bash
location /some/path/ {
    proxy_pass http://www.example.com/link/;
}
```
By default, NGINX redefines two header fields in proxied requests, “Host” and “Connection”, and eliminates the header fields whose values are empty strings. “Host” is set to the $proxy_host variable, and “Connection” is set to close.

To pass a request to a non-HTTP proxied server, the appropriate **_pass directive should be used:

* fastcgi_pass passes a request to a FastCGI server
* uwsgi_pass passes a request to a uwsgi server
* scgi_pass passes a request to an SCGI server
* memcached_pass passes a request to a memcached server

**proxy_set_header** is used to modify header fields of the request which 
is being passed and is used to change nginx default header fields setting .

#### Buffers
nginx buffers servers' responses and sends them to client when the response is 
completely recieved from server , and it buffers it until the client downloads it . 

**proxy_buffers** controls the size and the number of buffers allocated for a request .

**proxy_buffer_size** sets the size of a buffer which proxied server responses are stored in . 

**proxy_buffering** has two values , on and off 

If buffering is disabled, the response is sent to the client synchronously while 
it is receiving it from the proxied server. This behavior may be desirable for fast
interactive clients that need to start receiving the response as soon as possible.