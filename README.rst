RabbitMQ
========

RabbitMQ with management interface enabled and SSL support.


Environment Variables
---------------------

RABBITMQ_SSL_CERT_FILE
  The certificate to use for SSL

RABBITMQ_SSL_KEY_FILE
  The private key assocatied with the SSL certificate

RABBITMQ_SSL_CA_FILE
  The root certificate chain. This file can containe multiple root certificate chains, and is also being used to verify client certificates.

RABBITMQ_ERLANG_COOKIE
  Used for clustering and remote management via *rabbitmqctl*

RABBITMQ_DEFAULT_PASS
  The initias default user password

RABBITMQ_DEFAULT_USER
  The initial default user name

RABBITMQ_DEFAULT_VHOST
  The initial default RabbitMQ virtual host

Running the container
---------------------

When starting the containe we sholud specify ``-h/--hostname`` explicitly for each daemon so that we don't get a random hostname. The hostname is used as RabbitMQ node name, which is used as storage location for the Mnesia database.

Build
-----

.. code-block: Shell

  docker build -t hub.bccvl.org.au/rabbitmq/rabbitmq:3.6.0 .

Publish
-------

.. code-block: Shell

  docker push hub.bccvl.org.au/rabbitmq/rabbitmq:3.6.0
