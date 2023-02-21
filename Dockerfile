ARG BASE_REGISTRY=registry1.dso.mil
ARG BASE_IMAGE=ironbank/redhat/openjdk/openjdk11
ARG BASE_TAG=1.11

FROM quay.io/keycloak/keycloak:20.0.5 as upstream

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

USER root

RUN dnf update -y && \
    dnf clean all && \
    rm -rf /var/cache/dnf && \
    echo "keycloak:x:0:root" >> /etc/group && \
    echo "keycloak:x:1000:0:keycloak user:/opt/keycloak:/sbin/nologin" >> /etc/passwd

COPY --from=upstream --chown=1000:0 /opt/keycloak /opt/keycloak

# Prevent CCE-84038-9 and CCE-85888-6
RUN chmod -R 0750 /opt/keycloak

USER 1000

EXPOSE 8080 8443

HEALTHCHECK --timeout=5m --start-period=2m --retries=3 \
   CMD curl -fs http://localhost:8080 || curl -fsk https://localhost:8443 || exit 1

ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]
