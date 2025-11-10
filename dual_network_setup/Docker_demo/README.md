Start the Docker environment from the root folder with,
docker compose up --build -d ##This will build the environment and start the containers but detach the terminal from the process.

enter a device by using
docker compose exec deviceX bash ##Devices are device1, device2, device3

device3 should be able to ping both the other devices while the others should only be able to ping device3
