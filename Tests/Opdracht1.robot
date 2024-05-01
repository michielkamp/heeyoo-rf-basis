*** Settings ***
Library     Browser  enable_presenter_mode={"duration": "1 seconds", "width": "2px", "style": "dotted", "color": "blue"}
Test Setup  	Open SwagLabs


*** Test Cases ***
Validate opened
    [Tags]  Opdracht1B
    Get Title   ==  Swag Labs

Validate opened error
    [Tags]  Opdracht1C
    Get Title   ==  Swag Labssss

Login Test
    [Tags]  Opdracht1D
    Fill Text  id=user-name  standard_user
    Fill Text  id=password  secret_sauce
    Click      id=login-button
    Get Url  ==  https://www.saucedemo.com/inventory.html


*** Keywords ***
Open SwagLabs
    # Opdracht 1E: Test setup
    New Browser  chromium  headless=false
    New Page     https://www.saucedemo.com/