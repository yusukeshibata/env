#
# Base
#

FROM ubuntu:14.04

# package
USER root
RUN apt-get update -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:jonathonf/vim
RUN apt-get update -y
RUN apt-get install -y \
  openssh-server \
  curl git zsh vim tmux

# sshd
USER root
RUN sed -i 's/.*session.*required.*pam_loginuid.so.*/session optional pam_loginuid.so/g' /etc/pam.d/sshd
RUN mkdir /var/run/sshd

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

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
# RUN mkdir .ssh
# COPY id_rsa .ssh/id_rsa
# COPY id_rsa.pub .ssh/authorized_keys

USER shibata
RUN curl -sL https://raw.github.com/yusukeshibata/env/master/init.sh | sh

# ssh
USER root
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
