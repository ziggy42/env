FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
ARG ACCESS_KEY_ID 
ARG SECRET_ACCESS_KEY

ENV AWS_ACCESS_KEY_ID=${ACCESS_KEY_ID} 
ENV AWS_SECRET_ACCESS_KEY=${SECRET_ACCESS_KEY}

RUN apt update && apt install -y \
	byobu \
	zsh \
	man \
	curl \
	git \
	jq \
	tree \
	openjdk-11-jdk \
	gcc \
	g++ \
	make \
	awscli

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt install -y nodejs

RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
	&& cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
	&& chsh -s /bin/zsh \
	&& sed -i 's#PROMPT=\"#PROMPT=\"jail #' /root/.oh-my-zsh/themes/robbyrussell.zsh-theme

RUN cd /usr/bin && curl https://getmic.ro | bash

RUN apt clean

WORKDIR /root

CMD zsh
