LOCAL_LATEST=k8s-express-demo:latest
ECR_LATEST=083014189801.dkr.ecr.us-west-2.amazonaws.com/application-examples/k8s-express-demo:latest
.PHONY: build
build:
	docker build . -t ${LOCAL_LATEST}

.PHONY: push.ecr
push.ecr:
	docker tag ${LOCAL_LATEST} ${ECR_LATEST}
	docker push ${ECR_LATEST}

.PHONY: push.acr
push.acr:
	echo "NOOP"

.PHONY: push
push: build push.ecr push.acr
