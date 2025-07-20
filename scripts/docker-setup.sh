#!/bin/bash

# Docker setup script for BearBlog
set -e

echo "🐼 Setting up BearBlog with Docker..."

# Check if .env file exists
if [ ! -f .env ]; then
    echo "📝 Creating .env file from template..."
    cp env.example .env
    echo "⚠️  Please edit .env file with your actual values before continuing!"
    echo "   You can run this script again after editing .env"
    exit 1
fi

# Build and start services
echo "🔨 Building Docker images..."
docker-compose build

echo "🚀 Starting services..."
docker-compose up -d

# Wait for database to be ready
echo "⏳ Waiting for database to be ready..."
sleep 10

# Run migrations
echo "🗄️  Running database migrations..."
docker-compose exec -T web python manage.py migrate

# Collect static files
echo "📦 Collecting static files..."
docker-compose exec -T web python manage.py collectstatic --noinput

# Create superuser if needed
echo "👤 Do you want to create a superuser? (y/n)"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    docker-compose exec web python manage.py createsuperuser
fi

echo "✅ Setup complete! Your BearBlog is running at http://localhost"
echo "📊 You can view logs with: make docker-logs"
echo "🛑 Stop services with: make docker-down" 