###Code adapted from https://github.com/christronyxyocum/docker-organizr-v2/blob/master/root/etc/cont-init.d/30-install

#!/bin/sh

# Clone repo if it doesn't exist
# or update existing directory if it does
if [[ ! -d /app/.git ]]; then
  echo '----------------------'
  echo '| Cloning PythonChat |'
  echo '----------------------'
  git clone https://stefanelul2000:cc5aefcbc3c8b1818d21bf141622a565be9e5116@github.com/stefanelul2000/pythonchat.git /app #Change of repository and destination folder.
  cd /app || (echo 'Failed to load PythonChat repository folder'; exit)
elif [[ -d /app/.git ]]; then
  echo '----------------------'
  echo '| Updating PythonChat |'
  echo '----------------------'
  cd /app || (echo 'Failed to load PythonChat repository folder'; exit)
  git fetch
  git reset --hard origin/master
  git checkout master                   # Make git look for changes only in the master branch
  git reset --hard origin/master
  git pull
fi

# Start bot
python /app/bot.py
### End of code adapted from https://github.com/christronyxyocum/docker-organizr-v2/blob/master/root/etc/cont-init.d/30-install