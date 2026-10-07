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

Set `USER_EMAIL`, `USER_PASSWORD` and the example's `ANDROID_*` fields in `.env`, including Android version, device, package and activity. The app must already be installed. Empty required values fail before opening a session. `APPIUM_URL` selects the server; its default remains local.

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

The repository defines one Android login scenario. It does not provide an APK, a test account or evidence of iOS execution. Direct Appium stack versions are preserved; unused packages were removed. npm scripts do not restart ADB or enable device TCP access.

CI checks configuration loading and performs a Robot keyword **dry run**. It publishes a summary, JUnit and HTML as artifacts; this is not an Android run. Without an APK, account and device, actual login remains unverified. Run `python -m unittest test_env_loader` to check configuration without a device.

The Actions summary lists every scenario, duration, totals and blocking reason. The gate requires the count configured in the workflow, with no failures or skips; missing or invalid JUnit fails the gate. The summary is also included in the artifact.
