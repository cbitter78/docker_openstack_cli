VERSION=icehouse
RELEASE=3

COLOR_NORMAL=""
COLOR_RESET="\033[m"
COLOR_BOLD="\033[1m"
COLOR_RED="\033[31m"
COLOR_GREEN="\033[32m"
COLOR_YELLOW="\033[33m"

default: build

build:
	@echo ${COLOR_BOLD}➭${COLOR_RESET} ${COLOR_GREEN}Building Version ${VERSION}-${RELEASE}${COLOR_RESET}
	@docker build --rm -q -t cbitter78/openstack_cli:${VERSION}-${RELEASE} .

publish: build
	@echo ${COLOR_BOLD}➭${COLOR_RESET} ${COLOR_GREEN}Publishing Version ${VERSION}-${RELEASE}${COLOR_RESET}
	@docker push cbitter78/openstack_cli:${VERSION}-${RELEASE}

run: build
	@echo ${COLOR_BOLD}➭${COLOR_RESET} ${COLOR_GREEN}Running ${NAME}:${VERSION}-${RELEASE}${COLOR_RESET}
	@docker run --rm -ti --env=DOCKER_USER=${USER} -v ${HOME}:/${USER} cbitter78/openstack_cli:${VERSION}-${RELEASE} 
