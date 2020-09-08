### Docker Run
```
docker run \
--detach \
--name bytebin \
--restart unless-stopped \
--publish 8080:8080 \
--volume bytebin-config:/config \
bmoorman/bytebin:latest
```

### Docker Compose
```
version: "3.7"
services:
  bytebin:
    image: bmoorman/bytebin:latest
    container_name: bytebin
    restart: unless-stopped
    ports:
      - "8080:8080"
    volumes:
      - bytebin-config:/config

volumes:
  bytebin-config:
```

### Environment Variables
|Variable|Description|Default|
|--------|-----------|-------|
|TZ|Sets the timezone|`America/Denver`|
|BYTEBIN_HOST|Sets the IP address which bytebin binds to|`0.0.0.0`|
|BYTEBIN_PORT|Sets the port which bytebin listens on|`8080`|
|BYTEBIN_KEY_LENGTH|Sets how long the generated data tokens will be|`7`|
|BYTEBIN_MAX_CONTENT_LENGTH_MB|Sets how large uploaded files are allowed to be|`10`|
|BYTEBIN_LIFETIME_MINUTES|Sets how long content should persist for before being deleted|`1440`|
