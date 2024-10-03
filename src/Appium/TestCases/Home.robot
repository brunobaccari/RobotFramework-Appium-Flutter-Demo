*** Settings ***
Documentation       Teste regressivo automatizado da Home

Library             AppiumLibrary
Resource            ../Resources/Variables.robot
Resource            ../Helpers/Given.robot
Resource            ../Pages/Login.robot
Resource            ../Helpers/Gherkin_Pattern.robot


*** Keywords ***
CT: Login Sucessful
    Given you open the APP
    When click on I ALREADY HAVE AN ACCOUNT
    And insert the login
    And insert the password
    And click SIGN IN
    Then it should be logged in
