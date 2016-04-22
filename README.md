## OpenStack CLI

This is my docker image I use to interact with openstack.

When you use more than one version of openstack because your doing dev work or any other reason you may need different versions of the openstack CLI clients. This can cause issues if you try to install them locally. You can use different python environments but why? We have DOCKER!

### Branches

Differnt branches of this project, each with a docker file that can produce a continer with diffent versions of CLI installed.   For example icehouse would have the CLI clinets for icehouse.


## Usage

```
docker pull cbitter78/openstack_cli
docker run --rm -ti -v ~/openstack:/openstack cbitter78/openstack_cli:icehouse-1

```

You can do as I do and mount a folder that holds your openstack env files like this

```
-v ~/openstack:/openstack

```
