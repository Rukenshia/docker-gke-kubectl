image:
	docker build -t ruken/docker-gke-kubectl:latest .
	docker push ruken/docker-gke-kubectl

.PHONY: image