FROM ubuntu:xenial
MAINTAINER Fmstrat <fmstrat@NOSPAM.NO>

ENV DEBIAN_FRONTEND noninteractive


# Install all apps
# The fourth line is for multi-site config (ping is for testing later)
RUN apt-get update && apt-get upgrade -y; \
    apt-get install -y pkg-config; \
    apt-get install -y attr acl samba smbclient ldap-utils winbind libnss-winbind libpam-winbind krb5-user krb5-kdc supervisor; \
    apt-get install -y openvpn inetutils-ping; \
    apt-get install -y ntp;

# Set up script and run
ADD init.sh /init.sh
RUN chmod 755 /init.sh
CMD /init.sh setup
