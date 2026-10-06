*** Settings ***
Documentation       Suite de Home

Library             AppiumLibrary
Resource            ../TestCases/Home.robot

Test Teardown       Close Application


*** Test Cases ***
CT: Login Sucessful
    Run Keyword    CT: Login Sucessful
