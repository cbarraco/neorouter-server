# By default there is nothing in dbroot so nr fails to start.
# This will populate dbroot on first startup.
if [ ! -f "/data/NeoRouter_0_0_1.db" ]; then
    mv /usr/local/ZebraNetworkSystems/NeoRouter/* /data/
fi
/usr/bin/nrserver -run --dbroot /data
