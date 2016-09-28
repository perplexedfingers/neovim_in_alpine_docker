FROM alpine
MAINTAINER Ray Zhu <r2qokk@gmail.com>
RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache \
        neovim@testing \
# nvim is ready now. all script below can be modified
	    python3-dev python-dev \
# `gcc` and `musl-dev` are ruquired by pip when pip installs packages
		gcc musl-dev \
		make git openssh \
    && python3 -m ensurepip --upgrade && python -m ensurepip --upgrade \
    && pip3 install -U --user \
	    neovim \
	    flake8 autopep8 isort jedi \
    && pip2 install -U --user \
        neovim \
        jedi
COPY .git* /root/
RUN mkdir -p /root/.ssh
COPY .ssh /root/.ssh
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/* && chmod 644 /root/.ssh/*.pub \
    && ssh-agent sh -c 'ssh-add;'
RUN mkdir -p /root/.config \
    && git clone git@github.com:r2qokk/vim-config.git /root/.config/nvim \
    && ln -s /root/.config/nvim /root/.vim && ln -s /root/.config/nvim/init.vim /root/.vimrc \
    && cd /root/.config/nvim && make test && make
CMD ["nvim"]
