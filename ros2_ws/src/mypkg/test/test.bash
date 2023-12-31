#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_2023/ros2_ws/src/person_msgs
colcon build
source $dir/.bashrc
timeout 10 ros2 launch mypkg talk_listen.launch.py > /tmp/mypkg.log

cat /tmp/mypkg.log |
grep 'Listen: 10'
