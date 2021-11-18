killall -q polybar

PRIMARY=$(xrandr | awk '/ primary/{print $1}')
ACTIVE_MONITORS=$(xrandr | awk '/ connected/{print $1}')

echo "primary: '$PRIMARY'"
echo "active monitor: '$ACTIVE_MONITORS'"

for i in $ACTIVE_MONITORS; do
	echo "$i"
	if [[ "$i" == "$PRIMARY" ]]
	then
		MONITOR="$i" polybar main > /dev/null & disown
	else
		MONITOR="$i" polybar second > /dev/null & disown
	fi
done

echo "Bars launched..."
