FROM java:8-jdk
MAINTAINER Nils Andreas Svee <me@lochnair.net>

# Set environment variable defaults
ENV AMP_MODULE "Minecraft"
ENV AMP_PORT "8080"
ENV AMP_LICENSE "<INSERT_KEY_HERE>"
ENV AMP_PASSWORD "Changeme123"
ENV AMP_FLAGS ""

# Expose AMP port
EXPOSE ${AMP_PORT}

# Install AMP dependencies
RUN apt-get update && apt-get install -y \
	lib32gcc1 \
	coreutils \
	screen \
	socat \
	unzip \
	git \
	wget \
&& rm -rf /var/lib/apt/lists/*

# Create user for AMP
RUN useradd -r -U -m amp

# Download AMP Instance Manager
WORKDIR /home/amp
ADD "https://cubecoders.com/Downloads/ampinstmgr.zip" "/home/amp/ampinstmgr.zip"

# Change owner of volume to AMP user
RUN chown -R amp:amp /home/amp

USER amp

RUN unzip ampinstmgr.zip

# Copy AMP wrapper script
COPY amp /home/amp/amp

VOLUME /home/amp

CMD ["./amp"]
