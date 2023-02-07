##@ Build

AGENTSAPP_MAIN=./cmd/agents/app/main.go

.PHONY: build
build: fmt vet ## Build manager binary.
	$(GO) build -o bin/agentapp ${AGENTSAPP_MAIN}

.PHONY: run
run: fmt vet ## Run a controller from your host.
	$(GO) run ${AGENTSAPP_MAIN}

# If you wish built the manager image targeting other platforms you can use the --platform flag.
# (i.e. docker build --platform linux/arm64 ). However, you must enable docker buildKit for it.
# More info: https://docs.docker.com/develop/develop-images/build_enhancements/
.PHONY: docker-build
docker-build: test ## Build docker image with the manager.
	docker build -t ${IMG} -f ${AGENTAPP_DOCKERFILE} .

.PHONY: docker-push
docker-push: ## Push docker image with the manager.
	docker push ${IMG}
