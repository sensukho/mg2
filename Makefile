BIN_DOCKER = 'docker'
BIN_DOCKER_COMPOSE = 'docker-compose'

#### CONTAINERS ACTIONS ####
new: create mg_install
create:
	./init $(NAME)
start:
	$(BIN_DOCKER_COMPOSE) up -d
stop:
	$(BIN_DOCKER_COMPOSE) stop
restart:
	$(BIN_DOCKER_COMPOSE) restart
kill:
	$(BIN_DOCKER_COMPOSE) down -v
stats:
	$(BIN_DOCKER) stats $(docker ps --format={{.Names}})
ps:
	$(BIN_DOCKER_COMPOSE) ps
activity:
	$(BIN_DOCKER_COMPOSE) logs -f --tail=500

#### MAGENTO ACTIONS ####
mg_install:
	./install $(CLONE)
mg_in:
	$(BIN_DOCKER_COMPOSE) exec --user www-data apache bash
mg_run:
	$(BIN_DOCKER_COMPOSE) exec --user www-data apache bash -c "$(CMD)"
mg_exe:
	$(BIN_DOCKER_COMPOSE) exec --user www-data apache bin/magento $(CMD)
mg_n98:
	$(BIN_DOCKER_COMPOSE) exec --user www-data apache n98-magerun2.phar $(CMD)
mg_xdebug:
	$(BIN_DOCKER_COMPOSE) exec --user root apache xdebug
mg_composer:
	$(BIN_DOCKER_COMPOSE) exec --user www-data apache composer $(CMD)
mg_update:
	$(BIN_DOCKER_COMPOSE) exec --user root apache bash -c "php -f bin/magento setup:upgrade; php -f bin/magento cache:flush; chmod -R 777 ."
