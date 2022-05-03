#!/bin/bash

export ROS_IP=192.168.0.10
export ROS_MASTER_URI=http://192.168.0.11:11311

source /opt/ros/melodic/setup.bash
source /home/$USER/esmacat_ws/devel/setup.bash

exec "$@"
