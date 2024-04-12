#! /bin/bash
_download_date=$(date -u +"%Y-%m-%d")

# Download OMP
OMP_VERSION="v8.17.0"

sudo wget "https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/$OMP_VERSION/posh-linux-amd64" -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

# Download themes
cp -r ~/.poshthemes "$HOME/.poshthemes.$_download_date.bak"
echo "Backup copied to ~/.poshthemes.$_download_date.bak"
mkdir ~/.poshthemes -p
_download_filename="themes_$_download_date.zip"
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O "$HOME/.poshthemes/$_download_filename"
unzip -v "$HOME/.poshthemes/$_download_filename" -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm "$HOME/.poshthemes/$_download_filename"

# Preview themes
for file in ~/.poshthemes/*.omp.json; do printf "%s\n" "$file"; oh-my-posh --config "$file"; echo ""; done;

# Show enable guidance
echo "*****************"
# shellcheck disable=SC2016
echo "Add eval \"$(printf '$(oh-my-posh init --config ~/.poshthemes/jandedobbeleer.omp.json)')\" to your /.bashrc"
echo "*****************"
