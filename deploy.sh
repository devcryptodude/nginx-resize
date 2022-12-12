docker stop nginxlight
docker rm nginxlight
docker build -t nginx . -f Dockerfile
docker run  --restart unless-stopped -d -p 80:80 -p 8888:8888 --network lightbay --name="nginxlight" -d nginx
