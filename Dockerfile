FROM python:3.12-slim-bookworm

# Install system dependencies
# Odoo needs various libraries for its python dependencies and runtime
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    postgresql-client \
    libpq-dev \
    libjpeg-dev \
    zlib1g-dev \
    libxml2-dev \
    libxslt1-dev \
    libfreetype6-dev \
    curl \
    git \
    wkhtmltopdf \
    xfonts-75dpi \
    xfonts-base \
    fonts-liberation \
    fonts-dejavu-core \
    locales \
    && echo "es_CL.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen \
    && rm -rf /var/lib/apt/lists/*

ENV LANG es_CL.UTF-8
ENV LC_ALL es_CL.UTF-8


# Set working directory
WORKDIR /app

# Copy requirements and install python dependencies
COPY requirements.txt /app/
# We might need to upgrade pip first
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of the application
COPY . /app/

# Install the application
RUN pip install -e .

# Setup entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose Odoo port
EXPOSE 8069

# Entrypoint to handle config generation
ENTRYPOINT ["/entrypoint.sh"]

# Default command to run Odoo using the generated config
CMD ["python3", "-m", "odoo", "-c", "/app/odoo.conf"]
