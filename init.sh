if [ ! -f "/data/NeoRouter_0_0_1.db" ]; then
	mv /usr/local/ZebraNetworkSystems/NeoRouter/* /data/
fi
/usr/bin/nrserver -run --dbroot /data
