*** Settings ***
Library        SeleniumLibrary
Test Setup     Open SwagLabs
Test Teardown  Close SwagLabs


*** Test Cases ***
Validate opened
    Title Should Be   Swag Labs

Validate opened error
    Title Should Be   Swag Labssss

Login Test
    Input text  id=user-name  standard_user
    Input password  id=password  secret_sauce
    Click Element   id=login-button
    Location Should Be   https://www.saucedemo.com/inventory.html


*** Keywords ***
Open SwagLabs
    Open Browser  https://www.saucedemo.com/  chrome  #options=add_argument('--headless')

Close SwagLabs
    Delete All Cookies
    Close Browser