# Use the do288-httpd-parent image as base
FROM quay.io/redhattraining/httpd-parent

# Change the port to 8080
EXPOSE 8080

# Override the LABEL from parent
LABEL io.openshift.expose-services="8080:http"

# Change web server port to 8080
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf

# Permissions to allow container to run on OpenShift
RUN chgrp -R 0 /var/log/httpd /var/run/httpd && \
    chmod -R g=u /var/log/httpd /var/run/httpd

# Run as a non-privileged user
USER 1001
