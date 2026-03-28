*** Settings ***
Library     Browser
Test Setup  Open Swag Labs


*** Test Cases ***
Falende login
    Fill Text  id=user-name  standard_user
    Fill Text  id=password  wrong_password
    Click      id=login-button
    Get Text   h3[data-test="error"]  ==  Epic sadface: Username and password do not match any user in this service


*** Keywords ***
Open Swag Labs
    New Browser     chromium    headless=false
    New Page        https://www.saucedemo.com
