FROM golang:1.22.3

LABEL org.opencontainers.image.source=https://github.com/sean9999/hakbox
LABEL org.opencontainers.image.description="a box for hacking"
LABEL org.opencontainers.image.licenses=MIT

#	utils
RUN apt update
RUN apt upgrade -y
RUN apt install -y build-essential fortune neovim tree curl wget htop neofetch tmux less sudo
COPY environment /etc/

#	tmux
COPY tmux/plugins /root/.tmux/plugins/tmp
COPY tmux.conf /root/.tmux.conf

#	reflection
COPY Dockerfile /root/
COPY README.md /root/

#	rust
#RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
#RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc
# RUN /root/.cargo/bin/cargo install bat exa

#	peter, paul, mary
RUN mkdir -p /root/peter /root/paul
COPY peter.sh /root/peter/prompt
COPY paul.sh /root/paul/prompt
COPY mary.sh /usr/local/bin/disciples
RUN chmod +x /usr/local/bin/disciples

CMD [ "/bin/bash" ]

