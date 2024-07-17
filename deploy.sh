#! /bin/bash
hugo
rm -r /mnt/slab/containers/proxy/perilune
mv public /mnt/slab/containers/proxy/perilune
