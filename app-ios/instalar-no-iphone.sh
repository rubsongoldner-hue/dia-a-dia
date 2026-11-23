#!/bin/bash
# Prepara o app Dia a Dia e abre no Xcode para instalar no iPhone.
# Rode de novo sempre que quiser atualizar o app (seus dados continuam no iPhone).
set -e
cd "$(dirname "$0")"
echo "== Dia a Dia: preparando o app para o iPhone =="

if [ ! -d /Applications/Xcode.app ]; then
  echo "Falta o Xcode. Instale pela App Store, abra uma vez para terminar a instalação e rode este comando de novo."
  open "macappstore://apps.apple.com/app/id497799835"
  exit 1
fi
if ! command -v node >/dev/null 2>&1; then
  echo "Falta o Node.js. Baixe a versão LTS em nodejs.org, instale e rode este comando de novo."
  open "https://nodejs.org/pt"
  exit 1
fi

npm install --no-audit --no-fund
npm run web
[ -d ios ] || npx cap add ios
npm run icones
npx cap sync ios
npx cap open ios

cat <<'MSG'

Pronto. O Xcode vai abrir o projeto.
1. Conecte o iPhone no cabo e escolha ele na barra de cima do Xcode.
2. Na primeira vez: clique em "App" na lateral > Signing & Capabilities > Team > escolha seu Apple ID.
3. Clique em ▶ (Run). O app aparece no iPhone.
O passo a passo completo está em app-ios/LEIA-ME.md.
MSG
