#!/usr/bin/env bash


# Symlink user settings.
rm -r ~/Library/Application\ Support/Code/User/settings.json
rm -r ~/Library/Application\ Support/Code/User/keybindings.json

ln -s ~/.dotfiles/conf/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.dotfiles/conf/vscode-keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# Install extensions.
code --install-extension EditorConfig.EditorConfig
code --install-extension Equinusocio.vsc-material-theme
code --install-extension PKief.material-icon-theme
# code --install-extension WakaTime.vscode-wakatime
code --install-extension alefragnani.project-manager
code --install-extension amatiasq.sort-imports
code --install-extension bradlc.vscode-tailwindcss
code --install-extension dbaeumer.vscode-eslint
code --install-extension dhedgecock.ember-syntax
code --install-extension eamodio.gitlens
# code --install-extension emberjs.vscode-ember
code --install-extension esbenp.prettier-vscode
code --install-extension ikappas.phpcs
code --install-extension joelday.docthis
code --install-extension josa.ember-related-files
code --install-extension lifeart.vscode-ember-unstable
code --install-extension mrmlnc.vscode-scss
code --install-extension ms-vscode.atom-keybindings
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension naumovs.color-highlight
code --install-extension octref.vetur
code --install-extension phanitejakomaravolu.emberes6snippets
code --install-extension prisma.vscode-graphql
code --install-extension shinnn.stylelint
code --install-extension stormwarning.json-template
code --install-extension thebarkman.vscode-djaneiro

# Symlink Project Manager extension settings.
rm -r ~/Library/Application\ Support/Code/User/projects.json
ln -s ~/.dotfiles/conf/vscode-projects.json ~/Library/Application\ Support/Code/User/projects.json
