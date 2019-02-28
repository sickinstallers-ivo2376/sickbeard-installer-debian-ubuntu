sudo apt-get install screen curl git-core build-essential libsqlite3-dev libbz2-dev libreadline-dev libssl-dev zlib1g-dev

sudo mkdir -p /opt/SickBeard/data
sudo chown $USER -R /opt/SickBeard

git clone https://github.com/midgetspy/Sick-Beard.git /opt/SickBeard/app
sudo git clone https://github.com/yyuu/pyenv /opt/SickBeard/.pyenv

sudo PYENV_ROOT=/opt/SickBeard/.pyenv /opt/SickBeard/.pyenv/bin/pyenv install 2.7.13
cd /opt/SickBeard/app
sudo /opt/SickBeard/.pyenv/versions/2.7.13/bin/pip install --upgrade pip
sudo /opt/SickBeard/.pyenv/versions/2.7.13/bin/pip install --upgrade pyopenssl ndg-httpsclient virtualenv lxml
sudo /opt/SickBeard/.pyenv/versions/2.7.13/bin/pip install -r requirements.txt

#change port
nano config.ini

echo "/opt/SickBeard/.pyenv/versions/2.7.13/bin/python2 /opt/SickBeard/app/SickBeard.py #--datadir=/opt/SickBeard/data" >> /opt/SickBeard/start-sickbeard.sh
sudo chown $USER:$USER -Rf /opt/SickBeard
cd /opt/SickBeard
sudo chmod +x start-sickbeard.sh
screen ./start-sickbeard.sh
