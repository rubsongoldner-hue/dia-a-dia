# Para o Claude Code no Mac: instalar o app Dia a Dia no iPhone

Você está no Mac do usuário. Objetivo: transformar este projeto num app nativo de iPhone e
instalá-lo no iPhone dele pelo Xcode. Fale com ele em português, de forma simples.

## O projeto
- `index.html`: o app inteiro (HTML, CSS e JS num arquivo só). Funciona offline e guarda os dados
  no próprio aparelho. Já detecta quando roda como app nativo (`window.Capacitor`) e então usa
  notificações locais, vibração nativa e a cor da barra de status.
- `app-ios/`: projeto Capacitor 8 (Swift Package Manager, sem CocoaPods).
  - `package.json`: dependências fixas (core/ios/cli 8.6.0, haptics, local-notifications, status-bar, assets).
  - `capacitor.config.json`: appId `com.rubsongoldner.diaadia`, nome "Dia a Dia".
  - `instalar-no-iphone.sh`: instala dependências, copia o `index.html` para `www/`, cria `ios/`,
    gera ícones e splash, roda `cap sync ios` e abre o Xcode.
  - `LEIA-ME.md`: passo a passo para pessoas.
- Repositório: https://github.com/rubsongoldner-hue/dia-a-dia (público; o GitHub Pages publica a versão web).

## O que fazer
1. Confira se há **Xcode** em /Applications (se não, peça ao usuário para instalar pela App Store e abrir uma vez)
   e **Node.js** (`node -v`; se faltar, instale a versão LTS, por exemplo via o instalador de nodejs.org ou Homebrew,
   pedindo autorização). Se `xcode-select -p` apontar para CommandLineTools, rode
   `sudo xcode-select -s /Applications/Xcode.app` (pede a senha do usuário).
2. Rode `bash app-ios/instalar-no-iphone.sh` a partir da raiz do projeto.
3. Compile para conferir antes de envolver o iPhone:
   `xcodebuild -project app-ios/ios/App/App.xcodeproj -scheme App -destination 'generic/platform=iOS' CODE_SIGNING_ALLOWED=NO build`
4. Passos que só o usuário pode fazer (guie um de cada vez e espere a confirmação):
   - No Xcode: alvo **App > Signing & Capabilities > Team > Add an Account**, entrar com o Apple ID
     e escolher "Personal Team". Se o Bundle Identifier der conflito, troque por outro único
     (e atualize `appId` em `app-ios/capacitor.config.json`).
   - Conectar o iPhone no cabo, desbloquear e tocar em **Confiar**.
   - Ativar **Ajustes > Privacidade e Segurança > Modo de Desenvolvedor** no iPhone.
5. Instale e rode no iPhone (botão ▶ no Xcode, ou `xcodebuild`/`xcrun devicectl` com o iPhone conectado).
6. Na primeira vez, o usuário confia no desenvolvedor em
   **Ajustes > Geral > VPN e Gerenciamento de Dispositivos**, abre o app e permite notificações.
7. Opcional: em **Window > Devices and Simulators**, marcar **Connect via network** para instalar sem cabo depois.

## Bom saber
- Com Apple ID gratuito, o app expira em 7 dias: é só rodar ▶ de novo (os dados ficam). Conta paga: 1 ano.
- O app nativo tem armazenamento próprio. Para trazer dados, use Painel > Ajustes > Google Drive
  (sincronização por um Google Apps Script do próprio usuário) ou Exportar/Importar backup.
- Ao mudar o `index.html`, rode `bash app-ios/instalar-no-iphone.sh` de novo e ▶ no Xcode.
- Se for enviar mudanças ao GitHub, `index.html` na raiz é o que o GitHub Pages publica.
