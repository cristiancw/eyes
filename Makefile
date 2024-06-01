NAME=eyes
REPO=cristiancw/eyes
VERSION=1.0.0
LATEST=false

help: #?#Show this help.
	@fgrep -h "#?#" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's|\\$$||' | sed -e 's|#?#||'

name: #?#Print container name.
	@echo $(NAME)

build: #?#Build the image. If sef the LATEST=true build the latest too.
	@$(MAKE) rmi
	@echo "\nStarting build $(REPO):$(VERSION)\n"
	docker build --no-cache -t $(REPO):$(VERSION) .
ifeq ($(LATEST), true)
	docker tag $(REPO):$(VERSION) $(REPO):latest
endif
	@echo "\nFinished build $(REPO):$(VERSION)\n"

push: #?#Push the image. If sef the LATEST=true push the latest too.
	@echo "\nStarting push $(REPO):$(VERSION)\n"
	docker push $(REPO):$(VERSION)
ifeq ($(LATEST), true)
	@echo "\nStarting push $(REPO):latest\n"
	docker push $(REPO):latest
	@echo "\nStarting build $(REPO):latest\n"
endif
	@echo "\nStarting build $(REPO):$(VERSION)\n"

run: #?#Run the container.
	@$(MAKE) rm
	@xhost +local:root
	docker run \
		--rm \
		--name $(NAME) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=${DISPLAY} \
		$(REPO):$(VERSION)
	@xhost -local:root

rmi: #?#Delete previous builds. If sef the LATEST=true build the latest too.
	@$(MAKE) rm
	@docker rmi $$(docker images $(REPO) -qa) -f 2>/dev/null || true

rm: #?#Stop and delete the image.
	@docker stop $(NAME) 2>/dev/null || true
	@docker rm $(NAME) 2>/dev/null || true
