*** Settings ***
Library     Browser


*** Test Cases ***
Opdracht1C
    [Setup]  Open Swag Labs
    Get Title   ==  Swag Labs
    Inloggen
    Get Url     ==  https://www.saucedemo.com/inventory.html


*** Keywords ***
Open Swag Labs
    New Browser     chromium    headless=false
    New Page        https://www.saucedemo.com

 Inloggen
    Type Text       id=user-name    standard_user
    Type Text       id=password     secret_sauce
    Click           id=login-button