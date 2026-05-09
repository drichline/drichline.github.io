---
title: "Containerized Passmark"
date: "2026-04-14"
lastmod: "2026-05-09"
---

I containerized passmark for easy x86 benchmarking. The program crashes when you scroll the terminal window; spent a while debugging it and it appears to be an issue with the binary. 

## Try it yourself


```docker run --rm -it docker.io/drichline/passmark```

```podman run --rm -it docker.io/drichline/passmark```


## Containerfile

{{< highlight bash>}}

# Start from Ubuntu 22.04 base image
FROM docker.io/ubuntu:22.04

# Install dependencies (ncurses 5 is not in Ubuntu 24.04 repos, so we fetch it from old releases)

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        libtinfo5 \
        libcurl4 \
        libncurses5 && \
    rm -rf /var/lib/apt/lists/*

# Copy your binary into the container
COPY pt_linux_x64 /usr/local/bin/

# Make sure it's executable
RUN chmod +x /usr/local/bin/pt_linux_x64

# Default command
CMD ["/usr/local/bin/pt_linux_x64"]



{{< / highlight>}}

