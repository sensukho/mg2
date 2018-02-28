![Magento 2](https://cdn.rawgit.com/rafaelstz/magento2-snippets-visualstudio/master/images/icon.png)

#  Magento 2 Docker to Development

### Apache 2.4 + PHP 7.0 + OPCache + MariaDB + N98 Magerun 2 + XDebug + Redis

[![Build Status](https://travis-ci.org/sensukho/mg2.svg?branch=master)](https://travis-ci.org/sensukho/mg2)
[![Build Status](https://images.microbadger.com/badges/image/sensukho/mg2-stack.svg)](https://microbadger.com/images/sensukho/mg2-stack)
[![Releases](https://img.shields.io/github/release/sensukho/mg2-stack.svg)](https://github.com/sensukho/mg2/releases)

### Requirements

**MacOS:**

Install [Docker](https://docs.docker.com/docker-for-mac/install/), [Docker-compose](https://docs.docker.com/compose/install/#install-compose) and [Docker-sync](https://github.com/EugenMayer/docker-sync/wiki/docker-sync-on-OSX).

**Windows:**

Install [Docker](https://docs.docker.com/docker-for-windows/install/), [Docker-compose](https://docs.docker.com/compose/install/#install-compose) and [Docker-sync](https://github.com/EugenMayer/docker-sync/wiki/docker-sync-on-Windows).

**Linux:**

Install [Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) and [Docker-compose](https://docs.docker.com/compose/install/#install-compose).

# How to use

### Features commands

| Commands | Description  | Options & Examples |
|---|---|---|
| `new`  | Use this command to setup new M2 project and configure/run the environment.  | `make new NAME=<PROJECT-NAME> CLONE=1` |
| `create`  | Use this command to set the name of the project and configure/run the environment.  | `make create NAME=<PROJECT-NAME>` |
| `install`  | Use this command to setup M2 project.  | `make install CLONE=1` |
| `start`  | You can start your container manually (after run once .init)  | |
| `stop`  | Stop your project containers  | |
| `kill`  | Stops containers and removes containers, networks, volumes, and images created to the specific project  | |
| `mg_in`  | Access your container  | |
| `mg_run`  | Use the power of the Magento CLI  | `make mg_run CMD=list` |
| `mg_n98`  | Use the Magerun commands as you want | `make mg_n98 CMD=list` |
| `./grunt-init`  | Prepare to use Grunt  | |
| `./grunt`  | Use Grunt specifically in your theme or completely, it'll do the deploy and the watcher.  | `./grunt luma` |
| `mg_xdebug`  |  Enable / Disable the XDebug | |
| `mg_composer`  |  Use Composer commands | `make mg_composer CMD=update` |
| `mg_update`  |  Update DB and flush cache | |

If you want to only environment for a Magento 2 project, use like that:

```
make create <PROJECT_NAME>
```

If you want to install the Magento 2, use like that:

```
make new NAME=demo CLONE=1`
```

### Panels

Enjoy your new panels!

**Web server:** http://<PROJECT_NAME>/

**PHPMyAdmin:** http://<PROJECT_NAME>:8080

**Local emails:** http://<PROJECT_NAME>:8025
