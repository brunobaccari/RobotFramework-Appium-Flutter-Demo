# Robot Framework · Appium · Flutter

[English version](README.en.md)

Exemplo de automação do login no aplicativo Reflectly para Android. O fluxo usa Robot Framework, AppiumLibrary e keywords organizadas em páginas, cenários e helpers.

## Preparar o ambiente

- Python com as dependências de `requirements.txt`.
- Node.js, Appium 2 e driver UiAutomator2 compatível; o projeto registra o driver 2.29.4.
- Android SDK, dispositivo ou emulador acessível pelo ADB.
- Aplicativo Reflectly já instalado e conta autorizada para testes.

```sh
python -m venv .venv
```

Ative com `.venv\Scripts\Activate.ps1` no PowerShell ou `source .venv/bin/activate` no Linux/macOS.

```sh
python -m pip install -r requirements.txt
npm install
cp .env.example .env
npx appium driver list --installed
```

Se o UiAutomator2 ainda não estiver registrado nessa instalação de Appium 2, use `npx appium driver install uiautomator2@2.29.4`. No PowerShell, copie o exemplo com `Copy-Item .env.example .env`.

Preencha `.env` com `USER_EMAIL`, `USER_PASSWORD` e os campos `ANDROID_*` do exemplo, incluindo a versão do Android, o dispositivo, pacote e activity. O aplicativo precisa estar instalado antes do teste. Valores obrigatórios vazios falham antes de abrir a sessão. `APPIUM_URL` permite selecionar o servidor; o padrão permanece local.

## Executar

Inicie o servidor em um terminal:

```sh
npx appium --base-path /wd/hub
```

Em outro terminal com o ambiente Python ativo:

```sh
robot -d results src/Appium/Clients/Home.robot
```

O cliente aponta para `http://127.0.0.1:4723/wd/hub`. Os relatórios ficam em `results`; `npm test` executa o mesmo cenário.

## Escopo

Há um cenário de login Android. O projeto não fornece APK, conta de teste ou evidência de execução iOS. Mantivemos as versões diretas da stack Appium e removemos pacotes não utilizados. Os scripts npm não reiniciam ADB nem habilitam acesso TCP no dispositivo.

O CI valida o carregador de configuração e faz **dry run** das keywords Robot. Publica summary, JUnit e HTML em artifacts; não é uma execução Android. Sem APK/conta/dispositivo fornecidos, o login real permanece não validado. Execute `python -m unittest test_env_loader` para conferir a configuração sem dispositivo.

O summary do Actions lista cada cenário, duração, totais e motivo de bloqueio. O gate exige a quantidade prevista no workflow, sem falhas ou skips; JUnit ausente ou inválido reprova. O resumo também acompanha o artifact.
