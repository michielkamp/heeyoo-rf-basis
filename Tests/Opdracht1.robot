*** Settings ***
Library     Browser  enable_presenter_mode={"duration": "1 seconds", "width": "2px", "style": "dotted", "color": "blue"}
Test Setup  	Open SwagLabs


*** Test Cases ***
Validate opened
    Get Title   ==  Swag Labs

Validate opened error
    Get Title   ==  Swag Labssss

Login Test
    Fill Text  id=user-name  standard_user
    Fill Text  id=password  secret_sauce
    Click      id=login-button
    Get Url  ==  https://www.saucedemo.com/inventory.html


*** Keywords ***
Open SwagLabs
    New Browser  chromium  headless=false
    New Page     https://www.saucedemo.com/