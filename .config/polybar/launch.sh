killall -q polybar

echo "---" | tee -a /tmp/polybar_main.log
polybar main 2>&1 | tee -a /tmp/polybar_main.log & disown
polybar second 2>&1 | tee -a /tmp/polybar_second.log & disown

echo "Bars launched..."
