*** Settings ***
Documentation       Suite de Home

Library             AppiumLibrary
Resource            ../TestCases/Home.robot

Test Teardown       Close Application


*** Test Cases ***
CT: Login Sucessful
    Run Keyword And Continue On Failure    CT: Login Sucessful
