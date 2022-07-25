#!/bin/sh
DEB_FEED_WORKDIR=build/tmp-glibc/deploy/deb
DEB_FEED_PORT=${1:-7777}

echo "Starting deb package feed..."
echo "Port: $DEB_FEED_PORT"
echo "Workdir: $DEB_FEED_WORKDIR"

cd $DEB_FEED_WORKDIR
python3 -m http.server $DEB_FEED_PORT
