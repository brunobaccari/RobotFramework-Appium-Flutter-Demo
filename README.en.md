# Robot Framework · Appium · Flutter

[Versão em português](README.md)

An Android login automation example for the Reflectly app. The flow uses Robot Framework, AppiumLibrary and keywords organized into pages, scenarios and helpers.

## Prepare the environment

- Python with the dependencies in `requirements.txt`.
- Node.js, Appium 2 and a compatible UiAutomator2 driver; the project records driver 2.29.4.
- Android SDK and a device or emulator reachable through ADB.
- Reflectly already installed and an account authorized for testing.

```sh
python -m venv .venv
```

Activate with `.venv\Scripts\Activate.ps1` in PowerShell or `source .venv/bin/activate` on Linux/macOS.

```sh
python -m pip install -r requirements.txt
npm install
cp .env.example .env
npx appium driver list --installed
```

If UiAutomator2 is not registered in that Appium 2 installation, run `npx appium driver install uiautomator2@2.29.4`. In PowerShell, copy the example with `Copy-Item .env.example .env`.

Set `USER_EMAIL`, `USER_PASSWORD` and the example's `ANDROID_*` fields in `.env`, including Android version, device, package and activity. The helper reads `ANDROID_APP` but does not pass an `app` capability to install an APK: the app must already be installed.

## Run

Start the server in one terminal:

```sh
npx appium --base-path /wd/hub
```

In another terminal with the Python environment active:

```sh
robot -d results src/Appium/Clients/Home.robot
```

The client connects to `http://127.0.0.1:4723/wd/hub`. Reports are written to `results`; `npm test` runs the same scenario.

## Scope

The repository defines one Android login scenario. It does not provide an APK, a test account or evidence of iOS execution. Historical dependencies are preserved; the flow was not rerun during this documentation review.
