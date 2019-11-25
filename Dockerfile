FROM ascdc/jdk8

LABEL maintainer "Luan Dep Trai <luanldt1905@gmail.com>"

RUN  \
  apt-get update && apt-get install --no-install-recommends -y \
  gcc git openssh-client less \
  && rm -rf /var/lib/apt/lists/* \
  && useradd -ms /bin/bash dev
  
  
ARG IDEA_VERSION=2019.2.4
ARG IDEA_BUILD=192.7142.36

ARG idea_source=https://download-cf.jetbrains.com/idea/ideaIU-${IDEA_VERSION}.tar.gz
ARG idea_local_dir=.IdeaIC${IDEA_VERSION}

WORKDIR /opt/idea

RUN curl -fsSL $idea_source -o /opt/idea/installer.tgz \
  && tar --strip-components=1 -xzf installer.tgz \
  && rm installer.tgz

USER dev
ENV HOME /home/dev

RUN mkdir /home/dev/.Idea \
  && ln -sf /home/dev/.Idea /home/dev/$idea_local_dir

ENTRYPOINT ["/bin/bash", "/opt/idea/bin/idea.sh"]