# Recursively clone the Caldera repository if you have not done so
git clone https://github.com/mitre/caldera.git --recursive

# Build the docker image. Change image tagging as desired.
# WIN_BUILD is set to true to allow Caldera installation to compile windows-based agents.
# Alternatively, you can use the docker compose YML file via "docker-compose build"
cd caldera
docker build . --build-arg WIN_BUILD=true -t caldera:latest

# Run the image. Change port forwarding configuration as desired.
docker run -p 8888:8888 caldera:latest