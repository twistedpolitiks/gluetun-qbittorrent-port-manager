NAME = gluetun-qbittorrent-port-manager
VERSION = `cat version`

build: Dockerfile start.sh
	docker build -t $(NAME):latest --label "version=$(VERSION)" .

push: Dockerfile start.sh version .secret
	cat .secret | docker login -u twistedpolitiks --password-stdin
	docker tag $(NAME):latest twistedpolitiks/$(NAME):$(VERSION)
	docker push twistedpolitiks/$(NAME):$(VERSION)
	docker tag $(NAME):latest twistedpolitiks/$(NAME):latest
	docker push twistedpolitiks/$(NAME):latest
