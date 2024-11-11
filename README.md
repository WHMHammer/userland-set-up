```{sh}
sudo apt-get update && \
sudo apt-get -y install git && \
cd "$HOME" && \
git clone https://github.com/WHMHammer/userland-set-up.git && \
sh userland-set-up/set-up.sh && rm -rf userland-set-up
```
