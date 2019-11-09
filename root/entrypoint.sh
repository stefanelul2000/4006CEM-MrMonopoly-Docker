#!/bin/sh

# Clone repo or update existing
if [[ ! -d /app/.git ]]; then
  echo '----------------------'
  echo '| Cloning PythonChat |'
  echo '----------------------'
  git clone https://stefanelul2000:fb05c7cb6d7d9223d07d1390a4e5f170736e4a9b@github.com/stefanelul2000/pythonchat.git /app
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

# Start bot
python /app/bot.py
