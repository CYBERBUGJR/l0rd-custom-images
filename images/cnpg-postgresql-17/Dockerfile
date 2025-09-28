FROM ghcr.io/cloudnative-pg/postgresql:17.6-standard-trixie

# To install any package we need to be root
USER root

# We update the package list, install our package
# and clean up any cache from the package manager
COPY postgresql-17-vchord_0.4.3-1_amd64.deb /tmp/
RUN set -xe; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		"/tmp/postgresql-17-vchord_0.4.3-1_amd64.deb" ; \
	rm -fr /tmp/* ; \
	rm -rf /var/lib/apt/lists/*;

# Change to the uid of postgres (26)
USER 26