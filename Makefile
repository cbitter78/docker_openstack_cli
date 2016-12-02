VERSION=latest
NAME=cbitter78/openstack_cli

COLOR_NORMAL=""
COLOR_RESET="\033[m"
COLOR_BOLD="\033[1m"
COLOR_RED="\033[31m"
COLOR_GREEN="\033[32m"
COLOR_YELLOW="\033[33m"

default: build

build: 
	@echo ${COLOR_BOLD}➭${COLOR_RESET} ${COLOR_GREEN}Building Version ${VERSION}${COLOR_RESET}
	@docker build --rm -q -t ${NAME}:${VERSION} .

publish: build
	@echo ${COLOR_BOLD}➭${COLOR_RESET} ${COLOR_GREEN}Publishing Version ${VERSION}${COLOR_RESET}
	@docker push ${NAME}:${VERSION}

run: build
	@echo ${COLOR_BOLD}➭${COLOR_RESET} ${COLOR_GREEN}Running ${NAME}:${VERSION}${COLOR_RESET}
	@docker run --rm -ti --env=DOCKER_USER=${USER} -v ${HOME}:/${USER} ${NAME}:${VERSION} 
