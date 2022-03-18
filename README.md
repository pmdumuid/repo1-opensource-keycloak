# Keycloak

Keycloak is an Open Source Identity and Access Management solution for modern Applications and Services.

## Building an optimized Keycloak image

The following Dockerfile creates a pre-configured Keycloak image that enables the metrics endpoint, enables the token exchange feature, and uses a PostgreSQL database.

Dockerfile:
```
FROM registry1.dso.mil/ironbank/opensource/keycloak/keycloak:latest as builder

ENV KC_METRICS_ENABLED=true
ENV KC_FEATURES=token-exchange
ENV KC_DB=postgres

RUN /opt/keycloak/bin/kc.sh build

FROM registry1.dso.mil/ironbank/opensource/keycloak/keycloak:latest

COPY --from=builder /opt/keycloak/lib/quarkus/ /opt/keycloak/lib/quarkus/

WORKDIR /opt/keycloak

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
```

## Documentation

To learn more about Keycloak [go to the complete documentation](https://www.keycloak.org/documentation.html).
