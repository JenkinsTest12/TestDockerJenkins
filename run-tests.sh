#!/bin/sh
echo 'building environment'
PATH=$WORKSPACE/venv/bin:/usr/local/bin:$PATH
echo 'path is'
echo PATH
if [ ! -d "venv" ]; then
        virtualenv venv
fi
. venv/bin/activate
pip install -r requirements.txt
