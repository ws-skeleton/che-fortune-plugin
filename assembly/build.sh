#!/bin/sh
set -e
set -u

if [ -f che-fortune-plugin.tar.gz ]; then
    rm che-fortune-plugin.tar.gz
fi

ls -la ..
tar cvf che-fortune-plugin.tar --exclude "../.git" --exclude "../hooks" --exclude "../assembly" --transform "flags=r;s|^|fortune-plugin/|" ..
cd etc
tar uvf ../che-fortune-plugin.tar .
cd ..
gzip che-fortune-plugin.tar

