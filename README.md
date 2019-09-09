## How to use

1) following instructions from manual [Download and Install AnswerHub Archive](http://docs.dzonesoftware.com/articles/13574/download-and-install-answerhub-archive-2.html)
of [AnswerHub On-Premise Install Guide](http://docs.dzonesoftware.com/articles/13557/answerhub-17-on-premise-install-guide-2.html)
extract AnswerHub into directory base/answerhub-X.Y.Z

2) set `APP_VERSION` in `base/Dockerfile` (or as argument in `docker-compose.yml`
or as argument `--build-arg` to `docker-compose build` command) to version X.Y.Z
from previous step

3) following instructions from manual [Upgrade On-Premise Installation](http://docs.dzonesoftware.com/articles/13580/upgrade-on-premise-installation-2.html)
copy your custom `plugins`, `themes` and `sites` folder into `custom/update/plugins`, `custom/update/themes` and
`custom/update/sites` accordingly

4) push database password into `.env` file inside `secrets` folder. For example,

```
database.password=<password>
```

(Note: Docker Compose will perform shell escape itself therefore password must
be in original form - not escaped)

5) setup this environment file into `docker-compose.yml` as `env_file` property

6) setup `database.url`, `database.user` and `database.name` into `CATALINA_OPTS`
inside `docker-compose.yml`

7) build images (`answerhub-test` is just example - please setups your own service with proper environment settings):

```
docker-compose -f docker-compose.utility.yml build answerhub-base
docker-compose -f docker-compose.utility.yml build answerhub-build
```

8) run `docker-compose up -d <service name>`

#### Example:

```
services:
  answerhub-test:
    build:
      context: custom
    image: registry.company.tld/answerhub:1.6.6-custom-2
    network_mode: "host"
    env_file:
      - secrets/test.env
    environment:
      CATALINA_OPTS: -Ddatabase.url=127.0.0.1 -Ddatabase.name=answerhub -Ddatabase.user=answerhub
```
