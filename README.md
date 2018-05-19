### How to use

Following instructions from manual [Download and Install AnswerHub Archive](http://docs.dzonesoftware.com/articles/13574/download-and-install-answerhub-archive-2.html)
of [AnswerHub On-Premise Install Guide](http://docs.dzonesoftware.com/articles/13557/answerhub-17-on-premise-install-guide-2.html)
extract AnswerHub into directory base/answerhub-X.Y.Z

Set `APP_VERSION` in `base/Dockerfile` (or as argument in `docker-compose.yml`
or as argument `--build-arg` to `docker-compose build` command) to version X.Y.Z
from previous step

Following instructions from manual [Upgrade On-Premise Installation](http://docs.dzonesoftware.com/articles/13580/upgrade-on-premise-installation-2.html)
copy your custom themes and "sites" folder into `custom/update/themes` and
`custom/update/sites` accordingly

push database password into `.env` file inside `secrets` folder. For example,

```
database.password=<password>
```

(Note: Docker Compose will perform shell escape itself therefore password must
be in original form - not escaped)

Setup this environment file into `docker-compose.yml` as `env_file` property

Setup `database.url`, `database.user` and `database.name` into `CATALINA_OPTS`
inside `docker-compose.yml`

Run `docker-compose build`

Run `docker-compose up -d <service name>`

Example:

```
services:
 answehub:
    build:
      context: base
      args:
       APP_VERSION: 1.6.6
    env_file:
      - secrets/test.env
    environment:
      CATALINA_OPTS: “-Ddatabase.url=localhost -Ddatabase.user=answerhub -Ddatabase.name=answerhub”
```