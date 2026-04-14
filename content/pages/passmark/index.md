---
title: "Containerized Passmark"
date: "2026-04-14"
---

I containerized passmark for easy x86 benchmarking. For some reason the program crashes when you scroll the terminal window; spent a while debugging it and still can't find the reason. 

## Try it yourself


```docker run --rm -it docker.io/drichline/passmark```

```podman run --rm -it docker.io/drichline/passmark```


## Containerfile

{{< highlight bash>}}

# Start from Ubuntu 24.04 base image
FROM ubuntu:24.04

# Install dependencies (ncurses 5 is not in Ubuntu 24.04 repos, so we fetch it from old releases)
RUN apt-get -y update && \
	apt-get -y install wget libcurl4t64 && \
	wget http://security.ubuntu.com/ubuntu/pool/universe/n/ncurses/libtinfo5_6.3-2ubuntu0.1_amd64.deb http://security.ubuntu.com/ubuntu/pool/universe/n/ncurses/libncurses5_6.3-2ubuntu0.1_amd64.deb && \
	apt-get -y install ./libtinfo5_6.3-2ubuntu0.1_amd64.deb ./libncurses5_6.3-2ubuntu0.1_amd64.deb

# RUN apt-get update && apt-get install -y wget gdebi-core && \
#     wget http://security.ubuntu.com/ubuntu/pool/universe/n/ncurses/libncurses5_6.3-2ubuntu0.1_amd64.deb && \
#     gdebi -n libncurses5_6.3-2ubuntu0.1_amd64.deb && \
#     rm libnlibncurses5_6.3-2ubuntu0.1_amd64.deb && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*



# Copy your binary into the container
COPY pt_linux_x64 /usr/local/bin/

# Make sure it's executable
RUN chmod +x /usr/local/bin/pt_linux_x64

# Default command
CMD ["/usr/local/bin/pt_linux_x64"]


{{< / highlight>}}

