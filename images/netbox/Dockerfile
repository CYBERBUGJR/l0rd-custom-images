# NetBox + plugins for l0rd.be (raspberry-pi cluster, arm64; amd64 built too).
# Keep BASE aligned with the netbox chart appVersion in
# gitops_l0rd.be/apps/infra/netbox/Chart.yaml.
ARG BASE=v4.6.7
FROM ghcr.io/netbox-community/netbox:${BASE}

# The base image declares no USER (runs as root); the chart sets the runtime
# securityContext, so don't override it here.
# The image ships uv, not pip, and the venv at $VIRTUAL_ENV has no pip in it.
# UV_NO_CACHE=1 is already set by the base image.
COPY plugins.txt /tmp/plugins.txt
RUN uv pip install -r /tmp/plugins.txt \
	&& rm -f /tmp/plugins.txt

# No collectstatic here: the netbox-docker entrypoint runs it at startup, which
# covers the static assets shipped by netbox-topology-views.
