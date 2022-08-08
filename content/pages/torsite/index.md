---
title: "How I hosted this Website on Tor"
date: "2022-08-08"
lastmod: "2022-08-08"
---

I have a soft spot for cryptography and alternative web protocols like [Gemini](https://gemini.circumlunar.space/) and Tor. Experimenting with any of these protocols is just a hobby project, but I've found that hosting on Tor is more practical and by far the best option for learning. This is how I hosted a [mirror](http://dakota3sjlgd5qt5nygektopktodk4krxw56xhkyzljhxuj3kroz5qqd.onion) of richline.rocks on Tor:

## 1. Generating a Vanity Domain

The latest version of Tor addressing uses an ed25519 key as the URL; brute force is the only method to generate a domain name containing a particular series of characters. I used [`oniongen-go`](https://github.com/rdkr/oniongen-go) to generate the keypair because Go allowed me to compile a multithreaded static-linked binary, drop it on FIT's student server, and run the Xeons full-blast for a few days with a high process niceness. As a result of all that wasted energy, I have a few fancy domain names starting with "dakota."

## 2. Tor Proxy

All the services on my machines are containerized in `podman` using existing OCI containers from Docker Hub. For this project, I used the image [goldy/tor-hidden-service](https://hub.docker.com/r/goldy/tor-hidden-service/) to run my Tor proxy. There was no configuration required beyond the example compose file, but I've copied my `compose.yml` below for reference:

{{< highlight yaml >}}

version: "2"

services:
  tor:
    image: goldy/tor-hidden-service
    container_name: tor
    restart: always
    links:
      - caddy
    environment:
        SERVICE1_TOR_SERVICE_HOSTS: 80:caddy:80
        SERVICE1_TOR_SERVICE_VERSION: '3'
        # Optional as tor version 2 is not supported anymore
        SERVICE1_TOR_SERVICE_KEY: |
          (privkey)
        # tor v3 address private key base 64 encoded
        TOR_EXTRA_OPTIONS: |
          HiddenServiceNonAnonymousMode 1
          HiddenServiceSingleHopMode 1
        # Uses a single hop between server and rendezvous point instead of 3; boosts performance to that of a clearnet site
  caddy:
    image: caddy:latest
    hostname: caddy
    restart: always
    volumes:
      - $PWD/Caddyfile:/etc/caddy/Caddyfile
      - /home/dakota/drichline.github.io:/var/www/html
      - data:/data
      - config:/config
volumes:
  data:
  config:

{{< / highlight >}}

## 3. Web Server
Caddy is my preferred web server. I tend not to use its automatic SSL feature because most of my services are internal, but it's amazing how much it can do with simple configuration; one-liner reverse proxies with websockets are amazing. My clearnet site is hosted on GitHub Pages, so the rendered site files are stored in the `gh-pages` branch of the main repository. To get an updated copy of the site onto my server's local storage, I just wrote a systemd unit that fetches changes every 10 minutes:

{{< highlight text >}}

[Unit]
Description=Update drichline.github.io directory
[Timer]
OnCalendar=*-*-* *:0/10:00
[Install]
WantedBy=timers.target


{{< / highlight >}}

{{< highlight text >}}

[Unit]
Description=Update drichline.github.io directory
[Service]
type=oneshot
User=dakota
ExecStart=/usr/bin/git -C /home/dakota/drichline.github.io/ pull origin gh-pages
ExecStartPost=/usr/bin/git -C /home/dakota/drichline.github.io/ clean -fxd

{{< / highlight >}}

It's a slightly messy solution, but still the best option for this particular machine. With this directory of site files, I can write a simple `Caddyfile` that hosts the website on port 80 of its podman container:

{{< highlight text >}}

:80 {
    root * /var/www/html
    file_server

{{< / highlight >}}

## 4. Finishing Touches

At this point, Tor should be connecting to other nodes with no network configuration necessary, Caddy is serving the site on port 80, and the Tor container should be able to `curl` files from it. To get the fancy ".onion available" button in the Tor browser URL bar, the `onion-location` property needs to be set in the http headers or html head. Since my site is hosted on GitHub, I simply added the following line to my page template:

{{< highlight html >}}

<meta http-equiv="onion-location" content="http://dakota3sjlgd5qt5nygektopktodk4krxw56xhkyzljhxuj3kroz5qqd.onion" />

{{< / highlight >}}

And the result:

{{< figure src="urlbar.png" alt="Tor Browser URL bar showing .onion available" >}}