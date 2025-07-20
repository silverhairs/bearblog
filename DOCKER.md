# Docker Deployment Guide for BearBlog

This guide will help you deploy BearBlog using Docker and Docker Compose.

## Prerequisites

- Docker and Docker Compose installed
- Git (to clone the repository)

## Quick Start

1. **Clone the repository** (if you haven't already):
   ```bash
   git clone <your-repo-url>
   cd bearblog
   ```

2. **Set up environment variables**:
   ```bash
   cp env.example .env
   # Edit .env with your actual values
   ```

3. **Run the setup script**:
   ```bash
   ./scripts/docker-setup.sh
   ```

## Manual Setup

If you prefer to set up manually:

1. **Create environment file**:
   ```bash
   cp env.example .env
   # Edit .env with your values
   ```

2. **Build and start services**:
   ```bash
   make docker-build
   make docker-up
   ```

3. **Run migrations**:
   ```bash
   make docker-migrate
   ```

4. **Collect static files**:
   ```bash
   make docker-collectstatic
   ```

5. **Create superuser** (optional):
   ```bash
   make docker-createsuperuser
   ```

## Environment Variables

Required environment variables in `.env`:

- `SECRET`: Django secret key
- `POSTGRES_DB`: PostgreSQL database name
- `POSTGRES_USER`: PostgreSQL username
- `POSTGRES_PASSWORD`: PostgreSQL password
- `POSTGRES_HOST`: PostgreSQL host
- `POSTGRES_PORT`: PostgreSQL port
- `MAILGUN_PASSWORD`: Mailgun SMTP password
- `ADMIN_EMAIL`: Admin email address

Optional:
- `SENTRY_DSN`: Sentry error tracking
- `LEMONSQUEEZY_SIGNATURE`: LemonSqueezy webhook signature
- `CLOUDFLARE_API_TOKEN`: Cloudflare API token
- `CLOUDFLARE_ZONE_ID`: Cloudflare zone ID

## Services

The Docker Compose setup includes:

- **web**: Django application (Gunicorn)
- **db**: PostgreSQL database
- **redis**: Redis cache
- **nginx**: Reverse proxy and static file server

## Development

For development with hot reloading:

```bash
make docker-dev-up
```

This will:
- Mount your local code into the container
- Use Django's development server
- Enable DEBUG mode

## Production

For production deployment:

```bash
make docker-prod-build
make docker-prod-up
```

Production features:
- Optimized Nginx configuration
- Resource limits
- Health checks
- Persistent volumes

## Useful Commands

```bash
# View logs
make docker-logs

# Access Django shell
make docker-shell

# Access database
make docker-shell-db

# Stop services
make docker-down

# Clean up everything
make docker-clean
```

## Ports

- **80**: Nginx (HTTP)
- **443**: Nginx (HTTPS)
- **8000**: Django (direct access)
- **5432**: PostgreSQL
- **6379**: Redis

## Volumes

- `postgres_data`: PostgreSQL data
- `redis_data`: Redis data
- `static_volume`: Static files
- `media_volume`: User uploaded media

## Troubleshooting

### Database connection issues
```bash
# Check if database is running
docker-compose ps db

# View database logs
docker-compose logs db
```

### Static files not loading
```bash
# Recollect static files
make docker-collectstatic
```

### Permission issues
```bash
# Fix file permissions
sudo chown -R $USER:$USER .
```

## SSL/HTTPS

To enable HTTPS:

1. Create an `ssl` directory
2. Add your SSL certificates:
   - `ssl/cert.pem` (certificate)
   - `ssl/key.pem` (private key)
3. Update `nginx.conf` to include SSL configuration

## Scaling

To scale the web service:

```bash
docker-compose up -d --scale web=3
```

## Backup

To backup the database:

```bash
docker-compose exec db pg_dump -U postgres bearblog > backup.sql
```

To restore:

```bash
docker-compose exec -T db psql -U postgres bearblog < backup.sql
```

## Monitoring

The setup includes health checks for all services. You can monitor them with:

```bash
docker-compose ps
```

## Support

For issues related to Docker deployment, check:
- Docker logs: `make docker-logs`
- Service status: `docker-compose ps`
- Resource usage: `docker stats` 