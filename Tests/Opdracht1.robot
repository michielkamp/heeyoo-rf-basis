*** Settings ***
Library     Browser  enable_presenter_mode={"duration": "1 seconds", "width": "2px", "style": "dotted", "color": "blue"}
Test Setup  Open SwagLabs
Test Tags   1E


*** Test Cases ***
Validate opened
    [Tags]  1B
    Get Title   ==  Swag Labs

Validate opened error
    [Tags]  1C
    Get Title   ==  Swag Labssss

Login Test
    [Tags]  1D
    Fill Text  id=user-name  standard_user
    Fill Text  id=password  secret_sauce
    Click      id=login-button
    Get Url  ==  https://www.saucedemo.com/inventory.html
    [Teardown]  Delete All Cookies


*** Keywords ***
Open SwagLabs
    New Browser  chromium  headless=false
    New Page     https://www.saucedemo.com/