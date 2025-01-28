#!/usr/bin/env bash


# Symlink user settings.
rm -r ~/Library/Application\ Support/Code/User/settings.json
rm -r ~/Library/Application\ Support/Code/User/keybindings.json

ln -s ~/.dotfiles/conf/vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.dotfiles/conf/vscode-keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# Install extensions.
code --install-extension alefragnani.project-manager
code --install-extension bradlc.vscode-tailwindcss
code --install-extension csstools.postcss
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension EditorConfig.EditorConfig
code --install-extension esbenp.prettier-vscode
code --install-extension GitHub.copilot
code --install-extension github.vscode-github-actions
code --install-extension GitHub.vscode-pull-request-github
code --install-extension GraphQL.vscode-graphql
code --install-extension ikappas.phpcs
code --install-extension mrmlnc.vscode-scss
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension naumovs.color-highlight
code --install-extension octref.vetur
code --install-extension PKief.material-icon-theme
code --install-extension sanity-io.vscode-sanity
code --install-extension stormwarning.json-template
code --install-extension stylelint.vscode-stylelint
code --install-extension svelte.svelte-vscode
code --install-extension thebarkman.vscode-djaneiro
code --install-extension unifiedjs.vscode-mdx
code --install-extension vitest.explorer
code --install-extension Vue.volar

# Symlink Project Manager extension settings.
rm -r ~/Library/Application\ Support/Code/User/projects.json
ln -s ~/.dotfiles/conf/vscode-projects.json ~/Library/Application\ Support/Code/User/projects.json
