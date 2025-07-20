.PHONY: dev shell logs 404 migrate makemigrations

dev:
	echo http://lh.co
	python manage.py runserver 0:80

migrate:
	python manage.py migrate

makemigrations:
	python manage.py makemigrations

shell:
	sudo heroku run python manage.py shell --app bear-blog

logs:
	sudo heroku logs --tail --app bear-blog --force-colors | grep "app\[web" | grep -Ev "(GET|POST|HEAD|OPTIONS)"

404:
	sudo heroku logs --tail --app bear-blog --force-colors | grep "heroku\[" | grep "404"

router:
	sudo heroku logs --tail --app bear-blog --force-colors | grep "heroku\[router" | grep -Ev "feed"

# Docker commands
docker-build:
	docker-compose build

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

docker-logs:
	docker-compose logs -f

docker-shell:
	docker-compose exec web bash

docker-migrate:
	docker-compose exec web python manage.py migrate

docker-collectstatic:
	docker-compose exec web python manage.py collectstatic --noinput

docker-createsuperuser:
	docker-compose exec web python manage.py createsuperuser

docker-shell-db:
	docker-compose exec db psql -U postgres -d bearblog

# Production commands
docker-prod-build:
	docker-compose -f docker-compose.prod.yml build

docker-prod-up:
	docker-compose -f docker-compose.prod.yml up -d

docker-prod-down:
	docker-compose -f docker-compose.prod.yml down

# Development commands
docker-dev-up:
	docker-compose up

docker-dev-down:
	docker-compose down

# Cleanup
docker-clean:
	docker-compose down -v
	docker system prune -f