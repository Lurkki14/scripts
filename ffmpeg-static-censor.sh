#!/usr/bin/env sh

if [ "$#" -ne 3 ]; then
	echo "USAGE: ffmpeg-static-censor VIDEO MASK OUTPUT"
	exit
fi

#ffmpeg -i snarpii-noo.mp4 -i mask.png -filter_complex "[0:v][1:v]alphamerge,boxblur=10[alf];[0:v][alf]overlay[v]" -map "[v]" -map 0:a -c:v libx264 -c:a copy -movflags +faststart snmasked.mp4

ffmpeg -i "$1" -i "$2" -filter_complex "[0:v][1:v]alphamerge,boxblur=10[alf];[0:v][alf]overlay[v]" -map "[v]" -map 0:a -c:v libx264 -c:a copy -movflags +faststart "$3"
