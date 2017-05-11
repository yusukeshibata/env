#
# Base
#

FROM ubuntu:14.04

# package
USER root
RUN apt-get update -y
RUN apt-get install -y software-properties-common \
  python-software-properties
RUN add-apt-repository -y ppa:pi-rho/dev
RUN add-apt-repository -y ppa:neovim-ppa/unstable
RUN apt-key adv --keyserver pgp.mit.edu --recv D101F7899D41F3C3
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN apt-get update -y
RUN apt-get install -y \
  openssh-server \
  curl ruby git zsh tmux vim \
  build-essential \
  python-dev python-pip python3-dev python3-pip \
  python3-setuptools \
  neovim \
  tmux=2.0-1~ppa1~t

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
RUN chmod go+w,u+s /tmp

# sshd
USER root
RUN sed -i 's/.*session.*required.*pam_loginuid.so.*/session optional pam_loginuid.so/g' /etc/pam.d/sshd
RUN mkdir /var/run/sshd

# vim
USER root
RUN update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
RUN update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
RUN update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60

# user
USER root
RUN echo 'root:root' | chpasswd
RUN useradd -m shibata \
  && echo "shibata ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo 'shibata:shibata' | chpasswd
RUN chsh -s /usr/bin/zsh shibata
RUN echo 'shibata:shibata' | chpasswd

WORKDIR /home/shibata
ENV HOME /home/shibata

# env
USER root
ADD .ssh/id_rsa .ssh/id_rsa
ADD .ssh/id_rsa.pub .ssh/authorized_keys
ADD .ssh/config .ssh/config

USER root
RUN chown -R shibata:shibata .ssh
RUN chmod go-rw -R .ssh

USER shibata
RUN curl -sL https://raw.github.com/yusukeshibata/env/master/init.sh | sh

# time
USER root
RUN echo 'US/Pacific-New' > /etc/timezone
# RUN ntpdate pool.ntp.org

# git-flow
USER root
RUN curl -OL https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh
RUN sh gitflow-installer.sh

# linuxbrew
USER shibata
RUN ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"

# yarn
USER root
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -y
RUN apt-get install -y yarn --force-yes

# node
USER shibata
RUN curl -L git.io/nodebrew | perl - setup
RUN .nodebrew/current/bin/nodebrew install-binary stable
RUN .nodebrew/current/bin/nodebrew use stable

# ssh
USER root
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
