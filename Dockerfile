FROM hub.bccvl.org.au/centos/centos7-epel:2016-02-04

RUN yum -y install https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_6_0/rabbitmq-server-3.6.0-1.noarch.rpm

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


