*** Settings ***
Library     Browser
Test Setup  Open SwagLabs


*** Test Cases ***
Login Test by ID
    ${url}  Log in  standard_user  secret_sauce
    Should Be Equal  ${url}  https://www.saucedemo.com/inventory.html


*** Keywords ***
Open Swag Labs
    New Browser     chromium    headless=false
    New Page        https://www.saucedemo.com

Log in
    [Arguments]  ${user}  ${pass}
    Fill Text  id=user-name  ${user}
    Fill Text  id=password  ${pass}
    Click      id=login-button
    ${url}  Get Url
    RETURN  ${url}
