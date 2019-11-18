#!/bin/sh

# Clone repo if it doesn't exist
# or update existing directory if it does
if [[ ! -d /app/.git ]]; then
  echo '----------------------'
  echo '| Cloning PythonChat |'
  echo '----------------------'
  git clone https://github.com/stefanelul2000/pythonchat.git /app
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