*** Settings ***
Library     Browser
Resource    Variables.resource
Test Setup  Open SwagLabs


*** Test Cases ***
Login Test by ID
    ${actual_url}  Log in  ${USER}  ${PASS}
    Should Be Equal  ${actual_url}  ${URL}/inventory.html


*** Keywords ***
Open Swag Labs
    New Browser     chromium    headless=false
    New Page        ${URL}

Log in
    [Arguments]  ${user}  ${pass}
    Fill Text  id=user-name  ${user}
    Fill Text  id=password  ${pass}
    Click      id=login-button
    ${actual_url}  Get Url
    RETURN  ${actual_url}
