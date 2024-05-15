FROM golang:1.22.3

#	metadata
LABEL org.opencontainers.image.source=https://github.com/sean9999/hakbox
LABEL org.opencontainers.image.description="a box for hacking"
LABEL org.opencontainers.image.licenses=MIT

#	essential utils
RUN apt update
RUN apt upgrade -y
RUN apt install -y build-essential fortune neovim tree curl wget tmux less sudo neofetch htop

#	rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

#	optional benchmarking utils
RUN apt install -y stress-ng p7zip-full hardinfo sysbench s-tui stress

#	environment
COPY environment /etc/

#	tmux
COPY tpm /root/.config/tmux/plugins/tpm
COPY tmux.conf /root/.tmux.conf

#	reflection
COPY Dockerfile /root/
COPY README.md /root/

#	crate: bat
RUN /root/.cargo/bin/cargo install bat 
RUN echo "alias cat='bat -pp'" >> $HOME/.bashrc

#	crate: exa
RUN /root/.cargo/bin/cargo install exa
RUN echo "alias ls='exa --icons'" >> $HOME/.bashrc
RUN echo "alias ll='exa --icons -1 -a'" >> $HOME/.bashrc

#	peter, paul, mary
RUN mkdir -p /root/peter /root/paul
COPY peter.rc /root/peter/.bashrc
COPY paul.rc /root/paul/.bashrc
COPY mary.sh /usr/local/bin/disciples
RUN chmod +x /usr/local/bin/disciples

CMD [ "/bin/bash" ]
