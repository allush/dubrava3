ENV ?= dubrava3.dev
BRANCH ?= master

start:
	docker-compose -f config/${ENV}/docker-compose.yml up -d \
		--force-recreate \
		--remove-orphans

stop:
	docker-compose -f config/${ENV}/docker-compose.yml stop

ps:
	docker-compose -f config/${ENV}/docker-compose.yml ps

logs:
	docker-compose -f config/${ENV}/docker-compose.yml logs --tail 100 -f -t

migrate:
	docker exec rails.${ENV} bundle exec rake db:migrate

seed:
	docker exec rails.${ENV} bundle exec rake db:seed