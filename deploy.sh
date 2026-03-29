#!/bin/bash
set -euo pipefail
export PATH="/usr/local/dotnet:$PATH"
TARGET="deploy@10.0.0.209"
SSH="ssh -o StrictHostKeyChecking=no"
dotnet publish WolWeb.Host/WolWeb.Host.csproj -c Release -o /tmp/wolweb-publish
rsync -a --delete -e "$SSH" /tmp/wolweb-publish/ "$TARGET":/opt/wol-web/publish/
rm -rf /tmp/wolweb-publish
$SSH "$TARGET" "sudo systemctl restart wolweb"
echo "Deployed to wol-web"
