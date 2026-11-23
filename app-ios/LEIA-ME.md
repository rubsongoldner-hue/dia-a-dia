# Dia a Dia no iPhone, como app de verdade

Este é o mesmo Dia a Dia, empacotado como aplicativo nativo. Ele funciona sem internet,
e os avisos de horário tocam mesmo com o app fechado.

## Uma vez só: preparar o Mac
1. Instale o **Xcode** pela App Store e abra uma vez (aceite os termos e espere terminar).
2. Instale o **Node.js** (versão LTS) em https://nodejs.org/pt

## Instalar no iPhone
1. Abra o **Terminal** do Mac e cole:

   ```
   cd ~/Desktop && git clone https://github.com/rubsongoldner-hue/dia-a-dia.git && bash dia-a-dia/app-ios/instalar-no-iphone.sh
   ```

   O Xcode vai abrir sozinho no final.
2. No Xcode, clique em **App** (ícone azul na lateral esquerda) > aba **Signing & Capabilities**.
   Em **Team**, clique em **Add an Account**, entre com seu Apple ID e escolha **"Seu Nome (Personal Team)"**.
   Se aparecer erro de *Bundle Identifier*, troque `com.rubsongoldner.diaadia` por outro nome único, como `com.rubson.diaadia2`.
3. Conecte o iPhone no cabo, desbloqueie e toque em **Confiar neste computador**.
4. No iPhone: **Ajustes > Privacidade e Segurança > Modo de Desenvolvedor**, ative e deixe reiniciar.
5. No Xcode, escolha o seu iPhone na barra de cima e clique em **▶**.
6. Na primeira vez, o iPhone pede para confiar no desenvolvedor:
   **Ajustes > Geral > VPN e Gerenciamento de Dispositivos** > toque no seu Apple ID > **Confiar**.
7. Abra o **Dia a Dia** e permita as notificações.

## Bom saber
- **Apple ID gratuito:** a Apple faz o app parar de abrir depois de **7 dias**. Conecte o iPhone e clique em ▶ de novo;
  seus dados continuam lá. Com o Apple Developer Program (US$ 99/ano), dura 1 ano.
- **Sem cabo depois da primeira vez:** no Xcode, menu **Window > Devices and Simulators**, marque
  **Connect via network** para o seu iPhone. Com os dois no mesmo Wi-Fi, o ▶ instala sem fio.
- **Atualizar o app** quando houver versão nova:

  ```
  cd ~/Desktop/dia-a-dia && git pull && bash app-ios/instalar-no-iphone.sh
  ```

  e clique em ▶ no Xcode.
- **Seus dados:** o app nativo tem armazenamento próprio, separado da versão do Safari.
  Para levar o que você já tem, conecte o Google Drive nos dois (Painel > Ajustes > Google Drive)
  ou use Exportar/Importar backup.
