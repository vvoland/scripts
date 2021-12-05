#!/bin/bash
# To use with spydroid
ip="$1"
[ -z "$ip" ] && echo "usage: android-cam.sh <android-ip>" && exit 2

sudo modprobe v4l2loopback devices=1 video_nr=10 card_label="LoopbackCam" exclusive_caps=1
ffmpeg -y -i "rtsp://$ip:8086?camera=front"  -vf 'transpose=cclock' -f v4l2 /dev/video10 -vsync 2
