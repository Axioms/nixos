SECREENSHOT_LOCATION="$HOME/Pictures/Screenshots/Screenshot_$(date +%Y%m%d_%H%M%S).png"

grimblast -t png -o copysave area "$SECREENSHOT_LOCATION"
STATUS=$(notify-send --action 'default=default' --action 'ShowFile=Show File' "Screenshot of Area" "Area copied to buffer and saved to $SECREENSHOT_LOCATION" -i "$SECREENSHOT_LOCATION" -t 30000)

if [ "$STATUS" = "default" ]; then
    waytator $SECREENSHOT_LOCATION;
elif [ "$STATUS" = "ShowFile" ]; then
    xdg-open "$HOME/Pictures/Screenshots"
fi
