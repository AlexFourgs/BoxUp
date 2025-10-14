FROM python:3.14.0-slim-trixie

# Install basic library and compilers
RUN apt-get update && apt-get install -y --no-install-recommends \
	curl gcc g++ libffi-dev make && \
	rm -rf /var/lib/apt/lists/*

# Install uv
ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
ENV PATH="/root/.local/bin/:$PATH"

ADD . ./

WORKDIR /app
RUN uv sync --locked

ENV PATH="/.venv/bin:$PATH"

EXPOSE 80
