#!/usr/bin/env bash


# Symlink user settings.
rm -r ~/Library/Application\ Support/Code/User/settings.json
rm -r ~/Library/Application\ Support/Code/User/keybindings.json

ln -s ~/.dotfiles/conf/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.dotfiles/conf/vscode-keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# Install extensions.
code --install-extension AndrsDC.base16-themes
code --install-extension EditorConfig.EditorConfig
code --install-extension Equinusocio.vsc-material-theme
code --install-extension PKief.material-icon-theme
code --install-extension WakaTime.vscode-wakatime
code --install-extension alefragnani.project-manager
code --install-extension dbaeumer.vscode-eslint
code --install-extension donjayamanne.githistory
code --install-extension donjayamanne.python
code --install-extension dustinsanders.an-old-hope-theme-vscode
code --install-extension emberjs.vscode-ember
code --install-extension esbenp.prettier-vscode
code --install-extension felixrieseberg.vsc-ember-cli
code --install-extension ikappas.phpcs
code --install-extension joelday.docthis
code --install-extension josa.ember-related-files
code --install-extension mrmlnc.vscode-scss
code --install-extension ms-vscode.atom-keybindings
# code --install-extension ms-vscode.Theme-MaterialKit
code --install-extension naumovs.color-highlight
code --install-extension octref.vetur
code --install-extension phanitejakomaravolu.emberes6snippets
code --install-extension shinnn.stylelint
code --install-extension stormwarning.json-template
code --install-extension thebarkman.vscode-djaneiro
code --install-extension waderyan.gitblame
code --install-extension zhuangtongfa.Material-theme

# Symlink Project Manager extension settings.
rm -r ~/Library/App Support/Code/User/projects.json
ln -s ~/.dotfiles/conf/vscode-projects.json ~/Library/Application\ Support/Code/User/projects.json
