#!/bin/sh

APP=$1
TITLE=$2

# there may be instances of the app
declare -a INSTANCES

# get id of every possible instance
if [ -z "$TITLE" ]; then
  INSTANCES=($(niri msg -j windows | jq ".[] | select(.app_id==\"$(echo $APP)\")" | jq '.["id"]'))
else
  INSTANCES=($(niri msg -j windows | jq ".[] | select(.app_id==\"$(echo $APP)\" and .title==\"$(echo $TITLE)\")" | jq '.["id"]'))
fi

# if there is no instances: launch the app
# if [ ${#INSTANCES[@]} -eq 0 ]; then
    # niri msg action spawn -- $APP
# else
    # if there is only one instance, focus it
    if [ ${#INSTANCES[@]} -eq 1 ]; then
	    # echo "Found only one instance - focussing now."
	    niri msg action focus-window --id $INSTANCES
    else
	    # if there are more instances
	    # sort them
	    ISORTED=( $( printf "%s\n" "${INSTANCES[@]}" | sort -n ) )

            # get id of currently focused window
            FOCUSED=$(niri msg -j focused-window | jq '.id')

            # if no instance is in focus, focus the first one
	    if [[ ! " ${ISORTED[@]} " =~ ${FOCUSED} ]]; then

		    # app not in focus, so focus first instance
		    niri msg action focus-window --id ${ISORTED[0]}
	    else
		    # if an instance is already in focus, focus next one
		    count=-1
	            for i in "${ISORTED[@]}"
	            do
		            ((count=$count+1))

	                    if [ $i -eq ${FOCUSED} ]; then
				    # if instance is in focus, get next index
				    ((new_index=$count+1))
		            fi
	            done

                    # if focus is already on the last instance, focus on first instance
	            if [[ "$new_index" -eq "${#INSTANCES[@]}" ]]; then
			    ((new_index=0))
		    fi

            # if an instance is in focus, focus next one
	    niri msg action focus-window --id ${ISORTED[new_index]}
	    fi
    fi
# fi
