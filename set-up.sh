CURRENT_DIR="$(dirname $0)"

# termux
mkdir -p /host-rootfs/data/data/tech.ula/files/home/.termux
cp "${CURRENT_DIR}/termux.properties" /host-rootfs/data/data/tech.ula/files/home/.termux/termux.properties

# apt
sudo apt update
sudo apt-get -y install apt-utils ca-certificates
sudo apt-get -y full-upgrade
sudo apt-get -y install build-essential curl nano nginx python3 python3-venv wget zsh

# nano
sudo cp "${CURRENT_DIR}/.nanorc" /root/.nanorc
sudo cp "${CURRENT_DIR}/.nanorc" "${HOME}/.nanorc"

# zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo chsh -s /usr/bin/zsh
sudo cp "${CURRENT_DIR}/.zshrc" /root/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sudo chsh -s /usr/bin/zsh userland
cp "${CURRENT_DIR}/.zshrc" "${HOME}/.zshrc"

# code-server
curl -fsSL https://code-server.dev/install.sh | sh
mkdir -p "${HOME}/.config/code-server"
cp "${CURRENT_DIR}/code-server-config.yaml" "${HOME}/.config/code-server/config.yaml"
mkdir -p "${HOME}/.local/share/code-server/Machine"
cp "${CURRENT_DIR}/code-server-settings.json" "${HOME}/.local/share/code-server/Machine/settings.json"
cp "${CURRENT_DIR}/code-server-settings.json" "${HOME}/.local/share/code-server/User/settings.json"
export EXTENSIONS_GALLERY='{"serviceUrl":"https://marketplace.visualstudio.com/_apis/public/gallery","cacheUrl":"https://vscode.blob.core.windows.net/gallery/index","itemUrl":"https://marketplace.visualstudio.com/items"}' # source: https://github.com/microsoft/vscode/commit/b00945fc8c79f6db74b280ef53eba060ed9a1388
code-server --install-extension formulahendry.auto-rename-tag
code-server --install-extension aaron-bond.better-comments
code-server --install-extension ms-python.black-formatter
code-server --install-extension ms-vscode.cpptools
code-server --install-extension streetsidesoftware.code-spell-checker
code-server --install-extension tamasfe.even-better-toml
code-server --install-extension eamodio.gitlens
code-server --install-extension mateuszchudyk.hexinspector
code-server --install-extension george-alisson.html-preview-vscode
code-server --install-extension oderwat.indent-rainbow
code-server --install-extension josee9988.minifyall
code-server --install-extension ms-python.vscode-pylance
code-server --install-extension ms-python.python
code-server --install-extension ms-python.debugpy
code-server --install-extension mechatroner.rainbow-csv
code-server --install-extension rust-lang.rust-analyzer
code-server --install-extension richie5um2.vscode-sort-json

# rust
wget https://sh.rustup.rs -O rustup.sh
sh rustup.sh -y
rm rustup.sh

# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts
