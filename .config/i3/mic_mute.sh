MUTED=$(pamixer --get-mute --default-source)

if [ "$MUTED" == "true" ]
then
	dunstify -r 441 -u 2 -t 0 -i "/usr/share/icons/Flat-Remix-Black-Dark/status/scalable/512/notification-microphone-sensitivity-muted.svg" "Mic Off"
else
	dunstify -r 441 -u 1 -t 500 -i "/usr/share/icons/Flat-Remix-Black-Dark/status/scalable/512/notification-microphone-sensitivity-high.svg" "Mic On"
fi
