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

Preencha `.env` com `USER_EMAIL`, `USER_PASSWORD` e os campos `ANDROID_*` do exemplo, incluindo a versão do Android, o dispositivo, pacote e activity. O helper lê `ANDROID_APP`, mas não passa a capability `app` para instalar um APK: o aplicativo precisa estar instalado antes do teste.

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

Há um cenário de login Android. O projeto não fornece APK, conta de teste ou evidência de execução iOS. As dependências históricas foram preservadas; o fluxo não foi reexecutado nesta revisão documental.
