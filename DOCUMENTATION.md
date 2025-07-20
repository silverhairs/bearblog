# 🐳 BearBlog Docker Containerization

This document covers the Docker containerization changes made to BearBlog for deployment on platforms like Dokploy.

## 📁 New Files Added

### Docker Configuration
- `Dockerfile` - Multi-stage Docker container for the Django app
- `docker-compose.yml` - Main Docker Compose configuration
- `docker-compose.prod.yml` - Production-optimized setup
- `docker-compose.override.yml` - Development overrides
- `.dockerignore` - Files excluded from Docker build
- `nginx.conf` - Nginx reverse proxy configuration
- `scripts/docker-setup.sh` - Automated setup script

### Documentation
- `DOCKER.md` - Complete Docker deployment guide
- `CUSTOM_DOMAIN_DEPLOYMENT.md` - How to deploy under custom domains
- `env.example` - Environment variables template

## 🔧 Key Changes Made

### Environment Variables
- Added `MAIN_DOMAIN` for configurable domain support
- Added `MAIN_SITE_HOSTS` for domain resolution
- Replaced hardcoded database URL with individual DB config variables
- Added email configuration variables

### Django Settings (`conf/settings.py`)
- Updated CSRF trusted origins to use configurable domain
- Added database configuration from environment variables
- Updated email settings to use configurable domain
- Added domain resolution logic

### Domain Decoupling (`blogs/helpers.py`)
- Updated protected subdomains to use configurable main domain
- Removed hardcoded `bearblog.dev` references

## 🚀 Quick Start

```bash
# Clone and setup
git clone <your-repo>
cd bearblog
cp env.example .env
# Edit .env with your settings

# Run with Docker
./scripts/docker-setup.sh
```

## 📚 Detailed Guides

- **[Docker Deployment Guide](DOCKER.md)** - Complete setup instructions
- **[Custom Domain Deployment](CUSTOM_DOMAIN_DEPLOYMENT.md)** - Domain configuration

## 🔍 What Wasn't Changed

- Core BearBlog functionality remains unchanged
- Original `Caddyfile` still contains hardcoded `bearblog.dev` references
- No automated tests were added (project lacks test cases)
- Original templates still reference `bearblog.dev` for branding 