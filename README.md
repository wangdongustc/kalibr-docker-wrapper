# Kalibr Docker Wrapper

Run [Kalibr](https://github.com/ethz-asl/kalibr) in [Docker](https://www.docker.com)!

If you are using operating systems other than Ubuntu Linux, building and runing Kalibr calibration tools in [ROS](https://www.ros.org) can be very tricky.

This project builds Kalibr inside a ROS docker image, and wraps Kalibr tools with a shell script. So theoretically, it can run on most Linux systems with docker installed.

## Prerequest

- Install Docker, hopefully from your linux distribution source.

- Internet connection, as the building process needs to download apt & pip packages, and a seperated SuiteSparse package.

## Build

- Run ```./build.sh```

- Grab a coffe, building process takes around 20 minutes, depending on your computer performance and Internet connection speed.

## Run

- ```source ./setup.sh```

- Run kalibr programs directly. e.g. 
    ``` bash
    kalibr_bagcreater --folder data_folder --output-bag data.bag
    ```

## Notice

- Docker image "kalibr" takes around 2.7GB.

- --dont-show-result are passed by default to disable GUI.

- Host root directory ```/``` is mapped to docker ```/host/``` in docker if programs are run via ```./setup.sh```. This may be unsafe. Use carefully.

- Some Kalibr programs are tested to be working, some are tested to be not working, others are untested. See ```./setup.sh``` comments for details.

