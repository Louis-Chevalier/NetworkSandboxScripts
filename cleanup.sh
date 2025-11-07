# Remove old containers with the same name
echo "Removing containers with names 'indexServer' and 'peerN' where N= 1to 7"
echo ""
docker rm -f peer1 peer2 peer3 peer4 peer5 peer6 peer7 indexServer
echo "Removed old containers"

