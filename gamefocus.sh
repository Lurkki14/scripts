#!/usr/bin/env bash

while true; do
	winName=$(xdotool getwindowfocus getwindowname);
	#"$winName" == *"Team"* && qdbus org.kde.KWin /Compositor suspend #|| qdbus org.KWin /Compositor resume;
	#echo $winName;
	sub='Team Fortress 2 - OpenGL';
	if [[ "$winName" == *"$sub"* ]]; then
		#echo TF2;
		qdbus org.kde.KWin /Compositor suspend;
	else
		#echo Not TF2;
		qdbus org.kde.KWin /Compositor resume;
	fi
	sleep 2;
done
