MUTED=$(pamixer --get-mute)
VOLUME=$(pamixer --get-volume)

MESSAGE="Volume"
ICON="/usr/share/icons/Flat-Remix-Black-Dark/status/scalable/512/notification-audio-volume-high.svg"
LEVEL=0
TIME_OUT=800

if [[ "$MUTED" == "true" || "$VOLUME" == "0" ]]; then
	ICON="/usr/share/icons/Flat-Remix-Black-Dark/status/scalable/512/notification-audio-volume-muted.svg"
	MESSAGE="Muted"
	LEVEL=2
	TIME_OUT=0
elif [ "$VOLUME" -lt "40" ]; then
	ICON="/usr/share/icons/Flat-Remix-Black-Dark/status/scalable/512/notification-audio-volume-low.svg"
elif [ "$VOLUME" -lt "70" ]; then
	ICON="/usr/share/icons/Flat-Remix-Black-Dark/status/scalable/512/notification-audio-volume-medium.svg"
fi

dunstify -r 442 -u $LEVEL -t $TIME_OUT -h int:value:$VOLUME -i $ICON $MESSAGE
