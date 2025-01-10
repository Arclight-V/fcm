FROM ubuntu:20.04

# Install the necessary dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    ninja-build \
    && rm -rf /var/lib/apt/lists/*

# Install additional dependencies
# RUN apt-get install -y libboost-all-dev

#Copy the source code to the container
WORKDIR /app
COPY . /app

# Create a directory for the build and build the project
RUN mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release -G Ninja && ninja

# Specify the command to launch the application
CMD ["./build/fcm"]
