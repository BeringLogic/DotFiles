#!/bin/bash

if [ "${PAM_TYPE}" = "open_session" ]; then
  curl \
    -H prio:high \
    -H tags:warning \
    -d "SSH login: ${PAM_USER}@$(hostname) from ${PAM_RHOST}" \
    https://ntfy.ringlogic.com/SSH-Login
fi
