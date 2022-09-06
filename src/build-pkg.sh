#!/usr/bin/env bash

# Run as regular user
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts
nvm use --lts
npm install apk-mitm
yes | npx --  pkg -t node16-linux node_modules/apk-mitm/bin/apk-mitm
tar czf apk-mitm.tar.gz apk-mitm