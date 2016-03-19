FROM phusion/baseimage:0.9.18
MAINTAINER PoPs

# Add the i386 architecture to the list of packages
RUN dpkg --add-architecture i386
RUN apt-get -y update
# You don't need more libs to start the CSGO server
RUN apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386

#Steamcmd installation
RUN mkdir -p /server/steamcmd
RUN mkdir -p /server/csgo
WORKDIR /server/steamcmd
RUN curl http://media.steampowered.com/client/steamcmd_linux.tar.gz > steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz

# Don't use the RSSH facility
# RUN apt-get install -y openssh-server rssh
# ADD rssh.conf /etc/rssh.conf

# Install and update the CSGO server
WORKDIR /server/steamcmd
RUN ./steamcmd.sh +login anonymous +force_install_dir /server/csgo +app_update 740 validate +quit
# Add our custom server.cfg (should be done by yourself) 
RUN mkdir -p /server/csgo/csgo/cfg
ADD server.cfg /server/csgo/csgo/cfg/server.cfg
ADD cfg /server/csgo/csgo/cfg/
RUN mkdir -p /server/csgo/csgo/addons
ADD addons /server/csgo/csgo/addons

# Expose the CounterStrike port to the world
EXPOSE 27015

#Server Start
WORKDIR /server/csgo
ADD start.sh /server/csgo/start.sh
RUN chmod 755 /server/csgo/start.sh

CMD ["/server/csgo/start.sh"]
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
