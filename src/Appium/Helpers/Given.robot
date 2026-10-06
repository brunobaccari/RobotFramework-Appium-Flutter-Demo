*** Settings ***
Documentation       Start app

Library             ../Helpers/env_loader.py
Library             AppiumLibrary
Library             OperatingSystem
Resource            ../Resources/Variables.robot


*** Keywords ***
you open the APP
    ${ANDROID_AUTOMATION_NAME} =    Get Env Variable    ANDROID_AUTOMATION_NAME
    ${ANDROID_PLATFORM_NAME} =    Get Env Variable    ANDROID_PLATFORM_NAME
    ${ANDROID_DEVICENAME} =    Get Env Variable    ANDROID_DEVICENAME
    ${ANDROID_ACTIVITY} =    Get Env Variable    ANDROID_ACTIVITY
    ${ANDROID_APPPACKAGE} =    Get Env Variable    ANDROID_APPPACKAGE
    ${ANDROID_PLATFORM_VERSION} =    Get Env Variable    ANDROID_PLATFORM_VERSION
    ${APPIUM_URL}    Get Environment Variable    APPIUM_URL    http://127.0.0.1:4723/wd/hub
    Open Application    ${APPIUM_URL}
    ...    automationName=${ANDROID_AUTOMATION_NAME}
    ...    platformName=${ANDROID_PLATFORM_NAME}
    ...    platformVersion=${ANDROID_PLATFORM_VERSION}
    ...    deviceName=${ANDROID_DEVICENAME}
    ...    appPackage=${ANDROID_APPPACKAGE}
    ...    appActivity=${ANDROID_ACTIVITY}

click on
    [Arguments]    ${text}    ${time}

    Wait Until Page Contains    ${text}    ${time}
    Click Text    ${text}

fill in input
    [Arguments]    ${input_locator}    ${text_to_input}
    Wait Until Element Is Visible    ${input_locator}    timeout=30s
    Clear Text    ${input_locator}
    Input Text    ${input_locator}    ${text_to_input}

it should display
    [Arguments]    ${message}    ${time}
    Wait Until Page Contains    ${message}    ${time}

click on the element that contains
    [Arguments]    ${text}    ${time}
    Wait Until Page Contains    ${text}    ${time}
    Click Element    //android.view.ViewGroup[contains(@content-desc, "${text}")]
