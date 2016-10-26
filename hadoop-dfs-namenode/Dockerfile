FROM hadoop-base

MAINTAINER Nikita Romashkin <romashkin.nikita@gmail.com>

COPY entrypoint.sh /app
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]