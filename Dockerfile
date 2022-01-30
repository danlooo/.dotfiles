ARG VARIANT="focal"
FROM ubuntu:${VARIANT}

WORKDIR /build
COPY  bootstrap*.sh ./
RUN sh bootstrap_system.sh

WORKDIR /home/user
RUN  useradd user --create-home  --shell /bin/zsh
RUN chown user:user -R /home/user
USER user
COPY ./  /home/user/.dotfiles/ 
RUN zsh /home/user/.dotfiles/bootstrap_user.zsh
CMD zsh -i