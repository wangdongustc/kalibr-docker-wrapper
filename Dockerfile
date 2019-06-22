FROM ros:melodic-ros-core

RUN sed -i 's/packages.ros.org/mirrors.ustc.edu.cn/' /etc/apt/sources.list.d/ros-latest.list \
    && sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/' /etc/apt/sources.list \
    && sed -i 's/security.ubuntu.com/cn.archive.ubuntu.com/' /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y python-setuptools python-rosinstall \
                      ipython libeigen3-dev libboost-all-dev doxygen \
                      libopencv-dev ros-melodic-vision-opencv \
                      ros-melodic-image-transport-plugins \
                      ros-melodic-cmake-modules software-properties-common \
                      libpoco-dev python-matplotlib python-scipy python-git \
                      python-pip ipython libtbb-dev libblas-dev liblapack-dev \
                      python-catkin-tools libv4l-dev wget libxml2-dev \
                      libgtk-3-dev python-wxgtk3.0-dev python-pyx \
    && rm -rf /var/lib/apt/lists/* \
    && pip install python-igraph --upgrade \
    && pip install pil-compat cairocffi \
    && mkdir -p /ws/src && cd /ws \
    && catkin init && catkin config --extend /opt/ros/melodic 
COPY ./gui_workaround.patch /tmp/gui_workaround.patch

RUN cd /ws/src && git clone https://github.com/ethz-asl/kalibr.git \
    && cd kalibr && git apply /tmp/gui_workaround.patch \
    && cd /ws && catkin build -DCMAKE_BUILD_TYPE=Release -j"$(nproc)"

RUN sed -i '$isource "/ws/devel/setup.bash"' /ros_entrypoint.sh