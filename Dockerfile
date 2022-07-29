ARG BASE_REGISTRY=registry1.dso.mil
ARG BASE_IMAGE=ironbank/redhat/openjdk/openjdk11
ARG BASE_TAG=1.11

FROM quay.io/keycloak/keycloak:19.0.1 as upstream

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

USER root

RUN dnf update -y && \
    dnf clean all && \
    rm -rf /var/cache/dnf && \
    echo "keycloak:x:0:root" >> /etc/group && \
    echo "keycloak:x:1000:0:keycloak user:/opt/keycloak:/sbin/nologin" >> /etc/passwd

COPY --from=upstream --chown=1000:0 /opt/keycloak /opt/keycloak
COPY --chmod=755 --chown=1000:0 scripts/kc.sh /opt/keycloak/bin/kc.sh

USER 1000

EXPOSE 8080 8443

HEALTHCHECK --timeout=5m --start-period=2m --retries=3 \
   CMD curl -fs http://localhost:8080 || curl -fsk https://localhost:8443 || exit 1

ENTRYPOINT [ "/opt/keycloak/bin/kc.sh" ]
