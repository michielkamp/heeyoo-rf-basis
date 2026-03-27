*** Settings ***
Library     Browser


*** Test Cases ***
Opdracht1C
    New Browser     chromium    headless=false
    New Page        https://www.saucedemo.com
    Get Title   ==  Swag Labs
    Type Text       id=user-name    standard_user
    Type Text       id=password     secret_sauce
    Click           id=login-button
    Get Url     ==  https://www.saucedemo.com/inventory.html