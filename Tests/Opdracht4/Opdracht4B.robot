*** Settings ***
Library     Browser
Test Setup  Open SwagLabs


*** Variables ***
${USER}  standard_user
${PASS}  secret_sauce
${EXPECTED_URL}   https://www.saucedemo.com/inventory.html


*** Test Cases ***
Login Test by ID
    ${url}  Log in  ${USER}  ${PASS}
    Should Be Equal  ${url}  ${EXPECTED_URL}


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
