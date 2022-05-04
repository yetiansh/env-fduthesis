FROM ubuntu:20.04

ENV HOME=/usr/local
ENV BIN=/usr/bin/texlive
ENV RESOURCES=${HOME}/resources
ENV SCRIPTS=${HOME}/scripts
ENV PATH=${PATH}:${BIN}
ENV MF_HOME=${HOME}/texlive/texmf-local/tex/latex/fduthesis
WORKDIR ${HOME}

# install tools
RUN apt-get update && apt-get install -y git perl wget libfontconfig

# install texlive and packages
ADD resources ${RESOURCES}
RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -xvf install-tl-unx.tar.gz && \
    cd install-tl-* && ./install-tl -no-gui -profile ${RESOURCES}/tl.profile && \
    ln -s ${HOME}/texlive/20*/bin/*/ ${BIN} && \
    cd ${HOME} && rm install-tl-unx.tar.gz && rm -r install-tl-*
RUN cat ${RESOURCES}/packages-basic ${RESOURCES}/packages-to-add >> ${RESOURCES}/packages-to-install && \
    tlmgr update texlive-scripts && tlmgr install $(sed '/#/'d ${RESOURCES}/packages-to-install | tr '\n' ' ')

# install fduthesis
ENV GIT_MIRROR=https://gitee.com
RUN git clone ${GIT_MIRROR}/yetiansh/fduthesis.git
RUN cd fduthesis/source && xetex fduthesis.dtx && \
    mkdir ${MF_HOME} && cp *.cls *.def *.sty ${MF_HOME} && mktexlsr

CMD [ "/bin/bash" ]