*** Settings ***
Resource    ../../Resources/Data.resource
Resource    ../../Resources/SwagLabs.resource
Library     DataDriver
Test Setup  Open SwagLabs  ${URL}
Test Template  Data-driven login tests


*** Test Cases ***
Login failure flow


*** Keywords ***
Data-driven login tests
    [Arguments]  ${user}  ${pass}  ${expected_error}
    Log in  ${user}  ${pass}
    Validate login error  ${expected_error}