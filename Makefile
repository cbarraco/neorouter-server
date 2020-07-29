all: docker-push

.PHONY: docker-build
docker-build:
	docker build -t cbarraco/neorouter-server:latest .

.PHONY: docker-push
docker-push: docker-build
	docker push cbarraco/neorouter-server:latest
