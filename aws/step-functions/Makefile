.PHONY: build
build:
	docker build -t localhost:4510/fizz ./functions/fizz
	docker build -t localhost:4510/buzz ./functions/buzz
	docker build -t localhost:4510/buzz ./functions/fizzbuzz
.PHONY: push
push:
	docker push localhost:4510/fizz
	docker push localhost:4510/buzz
.PHONY: test
test:
	curl -X POST http://glyz8esv5j.execute-api.localhost.localstack.cloud:4566/live/fizzbuzz \
		-H 'Content-Type: application/json' \
		-H 'Accept: application/json' \
		-d '{"input": {"query": 5}}'
