sudo docker-compose down -v
sudo docker-compose down --rmi all

sudo docker stop $(sudo docker ps -qa)
sudo docker rm $(sudo docker ps -qa)
sudo docker rmi $(sudo docker images )
