*** Settings ***
Resource    ../Resources/SwagLabs.resource
Test Setup  Open SwagLabs  ${URL}


*** Test Cases ***
Login Test by ID
    Log in      ${USER}  ${PASS}
    Validate logged in   ${URL}/inventory.html

Login Fail
    Log in    ${USER}  ${WRONG_PASS}
    Validate login error


*** Keywords ***
Start test
    Log     Logging in with "${USER}"
