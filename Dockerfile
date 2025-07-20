# Use Python 3.11 slim image as base
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DJANGO_SETTINGS_MODULE=conf.settings

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    gcc \
    postgresql-client \
    libpq-dev \
    libjpeg-dev \
    zlib1g-dev \
    libfreetype6-dev \
    liblcms2-dev \
    libwebp-dev \
    tcl8.6-dev \
    tk8.6-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libxcb1-dev \
    pkg-config \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . .

# Create a non-root user
RUN adduser --disabled-password --gecos '' appuser
RUN chown -R appuser:appuser /app
USER appuser

# Collect static files
RUN python manage.py collectstatic --noinput

# Expose port
EXPOSE 8000

# Run gunicorn
CMD ["gunicorn", "conf.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3", "--timeout", "24", "--graceful-timeout", "5", "--max-requests", "10000"] 