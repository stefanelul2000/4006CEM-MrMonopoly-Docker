#!/bin/sh

# Clone repo or update existing
if [[ ! -d /app/.git ]]; then
  echo '----------------------'
  echo '| Cloning PythonChat |'
  echo '----------------------'
  git clone https://stefanelul2000:24fb384437f948b8122e4517d84006b69c15f214@github.com/stefanelul2000/pythonchat.git /app
  cd /app || (echo 'Failed to load PythonChat repository folder'; exit)
elif [[ -d /app/.git ]]; then
  echo '----------------------'
  echo '| Updating PythonChat |'
  echo '----------------------'
  cd /app || (echo 'Failed to load PythonChat repository folder'; exit)
  git fetch
  git reset --hard origin/master
  git checkout master
  git reset --hard origin/master
  git pull
fi

# Set Permissions
#chown -R abc:abc \
#        /config'

# Start bot
python /app/bot.py
