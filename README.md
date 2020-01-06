# docker-registry

The Registry is a stateless, highly scalable server side application that stores and lets you distribute Docker images. The Registry is open-source, under the permissive Apache license.


# Variables for create a automaticly certificate Openssh

```
ADMIN_REGISTRY_USER: Variable for to set a username
ADMIN_RESGITRY_PASSWD: Variable for to set a username
SSL: (true | false) - Create a auto certificate or disable SSL and registry will work on port 80 
COUNTRY: (BR|US|etc..)
STATE: State
LOCALITY: Province
ORGANIZATION: MYCOMPANY name
ORGANIZATIONALUNIT: Sector name
COMMON_NAME: A commun name FQDN
EMAIL: Admin email 
```

## Basic commands
Login on your registry

* SSL = True
```
docker login https://myregistry.mycompany.com.br
```

* SSL = false
```
docker login http://myregistry.mycompany.com.br
```

Start your registry as local test

```
$ docker-compose -f docker-compose-test-local.yml up -d --build

```

Start your registry as production enviroment

```
$ docker-compose up -d --build 

```

Pull (or build) some image from the hub

```
docker pull ubuntu
```

Tag the image so that it points to your registry

```
docker image tag ubuntu myregistry.mycompany.com.br/myfirstimage:tag
```

Push it
```
docker push myregistry.mycompany.com.br/myfirstimage:tag
```

Pull it back

```
docker pull myregistry.mycompany.com.br/myfirstimage:tag
```