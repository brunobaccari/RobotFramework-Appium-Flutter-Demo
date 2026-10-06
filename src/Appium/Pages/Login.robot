*** Settings ***
Resource    ../Resources/Variables.robot
Resource    ../Resources/Login.robot
Library     AppiumLibrary
Library     ../Helpers/env_loader.py


*** Keywords ***
click on I ALREADY HAVE AN ACCOUNT
    Wait Until Element Is Visible    ${ENTER_BUTTON}    30s
    Click Element    ${ENTER_BUTTON}

insert the login
    Wait Until Element Is Visible    ${EMAIL_FIELD}    30s
    Click Element    ${EMAIL_FIELD}
    ${USER_EMAIL}    Get Env Variable    USER_EMAIL

    Input Text    ${EMAIL_FIELD}    ${USER_EMAIL}

insert the password
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    30s
    Click Element    ${PASSWORD_FIELD}
    ${previous_level}    Set Log Level    NONE
    TRY
        ${USER_PASSWORD}    Get Env Variable    USER_PASSWORD
        Input Text    ${PASSWORD_FIELD}    ${USER_PASSWORD}
    FINALLY
        Set Log Level    ${previous_level}
    END

click SIGN IN
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    30s
    Hide Keyboard    Done
    Wait Until Element Is Visible    ${SIGN_IN}    30s
    Click Element    ${SIGN_IN}

it should be logged in
    Wait Until Element Is Visible    ${PLUS_BUTTON}    30s
