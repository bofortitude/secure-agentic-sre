
# Generate the certs
```shell
mkdir -p certs
openssl req -x509 -nodes -days 36500 -newkey rsa:2048 \
  -keyout ./certs/searxng.key \
  -out ./certs/searxng.crt \
  -subj "/C=US/ST=State/L=City/O=SRE/OU=DevOps/CN=localhost"
```





