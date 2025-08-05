#!/bin/bash

# Will turn the G1 key pink if the status of the project in the current folder is not up to date
# Or Green if it is up to date
# Will reset to Green on exit

trap ctrl_c INT

function ctrl_c() {
    echo "rgb g1:00ff00ff" > /tmp/ckbpipe001;
    exit;
}

while true; \
do \
    [[ -z $(git status --porcelain) ]] \
        && echo "rgb g1:00ff00ff" > /tmp/ckbpipe001 \
        || echo "rgb g1:cc0055ff" > /tmp/ckbpipe001; \
    sleep 5; \
done;
