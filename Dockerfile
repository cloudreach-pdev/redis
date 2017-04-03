FROM redis:alpine
COPY redis.conf .
CMD ["redis-server", "redis.conf"]
