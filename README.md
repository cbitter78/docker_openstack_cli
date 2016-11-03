## OpenStack CLI

This is my docker image I use to interact with openstack.

When you use more than one version of openstack because your doing dev work or any other reason you may need different versions of the openstack CLI clients. This can cause issues if you try to install them locally. You can use different python environments but why? We have DOCKER!

If you want a docker container that has the lates clients use https://hub.docker.com/r/chrisrock/openstack-cli/~/dockerfile/

### Branches

Differnt branches of this project, each with a docker file that can produce a continer with diffent versions of CLI installed.   For example icehouse would have the CLI clinets for icehouse.


## Usage

```
docker pull cbitter78/openstack_cli
docker run --rm -ti -v ~/openstack:/openstack cbitter78/openstack_cli:icehouse-3

```

You can do as I do and mount a folder that holds your openstack env files like this

```
-v ~/openstack:/openstack

```

If you have already sourced your openrc file from openstack you can do this

```shell

docker run --rm -ti -e DOCKER_USER=$USER \
                    -e OS_REGION_NAME=$OS_REGION_NAME \
                    -e OS_TENANT_ID=$OS_TENANT_ID \
                    -e OS_PASSWORD=$OS_PASSWORD \
                    -e OS_AUTH_URL=$OS_AUTH_URL \
                    -e OS_USERNAME=$OS_USERNAME \
                    -e OS_TENANT_NAME=$OS_TENANT_NAME \
    --volume ~/:/$USER cbitter78/openstack_cli:icehouse-3
```
This will start the docker container and give you a shell with your home folder mounted under / and all the needed env vars passed.
