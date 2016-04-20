FROM hub.bccvl.org.au/centos/centos7-epel:2016-04-15

RUN yum -y install http://www.rabbitmq.com/releases/erlang/erlang-18.3-1.el7.centos.x86_64.rpm && \
    yum -y install https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_6_1/rabbitmq-server-3.6.1-1.noarch.rpm

# remove guest user login on loopback interface
RUN echo '[{rabbit, [{loopback_users, []}]}].' > /etc/rabbitmq/rabbitmq.config

# get logs to stdout
ENV RABBITMQ_LOGS=- RABBITMQ_SASL_LOGS=-

COPY files/enabled_plugins /etc/rabbitmq/enabled_plugins

COPY files/entyrpoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose AMQP and HTTP (management) ports
EXPOSE 5672 5671 15672 15671

ENTRYPOINT ["/entrypoint.sh"]
CMD ["rabbitmq-server"]


