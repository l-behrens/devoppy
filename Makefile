DOCKER=docker
IMAGE=devoppy:latest
OPERATOR=.${SHELL}rc
ARCH := $(shell uname -m)
CONF_IMPORT := 

#Just checks 
UNINSTALL := $(shell sed -i '/^source .*\/develop\/devoppy\/run.sh/c\#source .*\/develop\/devoppy\/run.sh' ${HOME}/.zshrc)
INSTALLED := $(shell grep "^source .*/develop/devoppy/run.sh" ${HOME}/.zshrc &>/dev/null; echo  $$?)
ifneq ($(INSTALLED),0)
	conf := install_conf
endif


test:
	@echo "uninstalling" 
	$(shell sed -i '/^source .*\/develop\/devoppy\/run.sh/c\#source .*\/develop\/devoppy\/run.sh' ${HOME}/.zshrc)


install: $(conf)
	@echo "not implemented yet"

install_conf:
	$(shell echo "source ${HOME}/develop/devoppy/run.sh" >> ${HOME}/.zshrc)
	@echo "installing config"


build:
	@echo "update the image"
	$(DOCKER) build . -t $(IMAGE)

pull:
	@echo "pulling ${IMAGE} from docker hub"
	docker pull ${IMAGE} 
	@echo "done"

rm:
	@echo "erasing ${IMAGE} from registry"
	docker rmi ${IMAGE}
	@echo "done"
	@echo "removing container Functions from shell config"
	sed -i -e 's/few/asd/g' hello.txt

clean:
	@echo "not implemented yet"
