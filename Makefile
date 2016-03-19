NAME = egguy/docker-csgo-ebot
VERSION = 0.0.1

.PHONY: all build

all: cfg addons build

build:
	docker build -t $(NAME):$(VERSION) --rm .

addons:
	curl http://www.esport-tools.net/download/CSay-CSGO.zip > CSay-CSGO.zip
	unzip CSay-CSGO.zip
	rm CSay-CSGO.zip

cfg:
	curl http://gfx.esl.eu/media/counterstrike/csgo/downloads/configs/csgo_esl_serverconfig.zip > esl.zip
	unzip esl.zip -d cfg
	rm esl.zip
