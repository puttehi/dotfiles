#! /bin/bash
_download_date=$(date -u +"%Y-%m-%d")
# Download OMP
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
# Download themes
cp -r ~/.poshthemes ~/.poshthemes.$_download_date.bak
echo "Backup copied to ~/.poshthemes.$_download_date.bak"
mkdir ~/.poshthemes -p
_download_filename="themes_$_download_date.zip"
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/$_download_filename
unzip -v ~/.poshthemes/$_download_filename -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/$_download_filename
# Preview themes
for file in ~/.poshthemes/*.omp.json; do echo "$file\n"; oh-my-posh --config $file; echo ""; done;
# Show enable guidance
echo "*****************"
echo "Add eval "$(printf '$(oh-my-posh init --config ~/.poshthemes/jandedobbeleer.omp.json)')" to your /.bashrc"
echo "*****************"
