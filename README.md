## OpenStack CLI

This is my docker image I use to interact with openstack.

When you use more than one version of openstack because your doing dev work or any other reason you may need different versions of the openstack CLI clients. This can cause issues if you try to install them locally. You can use different python environments but why? We have DOCKER!

### Branches

Differnt branches of this project, each with a docker file that can produce a continer with diffent versions of CLI installed.   For example icehouse would have the CLI clinets for icehouse.


## Usage

```shell
docker run --rm -ti -e DOCKER_USER=$USER \
					-e OS_REGION_NAME=$OS_REGION_NAME \
					-e OS_TENANT_ID=$OS_TENANT_ID \
					-e OS_PASSWORD=$OS_PASSWORD \
					-e OS_AUTH_URL=$OS_AUTH_URL \
					-e OS_USERNAME=$OS_USERNAME \
					-e OS_TENANT_NAME=$OS_TENANT_NAME \
    --volume $PWD:/`basename $PWD` --volume ~/:/$USER cbitter78/openstack_cli:icehouse-3

```

Or you can use an alias

```shell
alias os_cli='docker run --rm -ti -e DOCKER_USER=$USER -e OS_REGION_NAME=$OS_REGION_NAME -e OS_TENANT_ID=$OS_TENANT_ID -e OS_PASSWORD=$OS_PASSWORD -e OS_AUTH_URL=$OS_AUTH_URL -e OS_USERNAME=$OS_USERNAME -e OS_TENANT_NAME=$OS_TENANT_NAME --volume $PWD:/`basename $PWD` --volume ~/:/$USER cbitter78/openstack_cli:icehouse-3'

```