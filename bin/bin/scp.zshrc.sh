#!/bin/bash

echo -n "Copying to phil@father: "
scp ~/.zshrc father:

echo -n "Copying to phil@linode.ringlogic.com: "
scp ~/.zshrc linode.ringlogic.com:
