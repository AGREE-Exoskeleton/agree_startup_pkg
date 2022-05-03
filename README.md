# Instructions to launch agree_ros_interface ROS node remotely

- copy env_remote.sh to /opt/ros/melodic/env_remote.sh to Client (Esmabox) machine.

- in Server (Smartbox) ROS launch, define a machine as follows:

<machine name="esmabox" address="192.168.0.10" user="esmacat" env-loader="/opt/ros/melodic/env_remote.sh" default="true" />

- replace address, user as needed.

- in Server (Smartbox) ROS launch, launch remote ROS node as follows:   <node machine="esmabox" name="ESMACAT" pkg="agree_esmacat_pkg" type="agree_ros_interface" output="screen"/>

- in Server (Smartbox), launch real-time node through run_agree_control_ssh.sh, as follows:

./home/$USER/catkin_ws/src/agree_startup_pkg/scripts/run_agree_control_ssh.sh

where, in Server machine, run_agree_control_ssh contains:

ssh esmacat@192.168.0.10  '/home/$USER/esmacat_rt/run_agree_control.sh'

where, in Client machine, run_agree_control.sh contains:

cd /home/esmacat/esmacat_rt/esmacat_master_high_performance-release/esmacat_applications/agree_esmacat_rt
sudo ./run.sh

- in Server (Smartbox), if needed, luanch real-time node through c++ code, as follows:

system("gnome-terminal -- /home/$USER/catkin_ws/src/agree_startup_pkg/scripts/run_agree_control_ssh.sh");

- now ROS interface node and real-time control node should be running together.

## Very important! configure ssh to enable superuser ssh communication without password.

# Instructions to modify .bashrc to configure ROS network

- gedit .bashrc

- modify .bashrc by adding the following lines. Un comment "Router use" or "No router use" accordingly. AGREE uses the router by default.

source /opt/ros/melodic/setup.bash
source /home/$USER/esmacat_ws/devel/setup.bash

# No router use
#export ROS_IP=10.0.0.10
#export ROS_MASTER_URI=http://10.0.0.1:11311

# Router use for Esmabox
export ROS_IP=192.168.0.10
export ROS_MASTER_URI=http://192.168.0.11:11311

# Router use for Smartbox
export ROS_IP=192.168.0.11
export ROS_MASTER_URI=http://192.168.0.11:11311



