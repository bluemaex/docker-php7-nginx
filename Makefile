NAME = bluemaex/php7-nginx
VERSION = 0.0.8

.PHONY: build run shell tag release

build:
	docker build -t $(NAME):$(VERSION) . -f Dockerfile

run:
	docker run -t --rm --name $(subst /,_,$(NAME)) $(NAME):$(VERSION)

shell:
	docker exec -it $(subst /,_,$(NAME)) sh

tag:
	docker tag $(NAME):$(VERSION) $(NAME):latest

release: build tag
	git tag $(VERSION)
	git push --tags
