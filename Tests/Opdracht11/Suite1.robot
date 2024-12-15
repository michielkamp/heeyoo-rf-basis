*** Settings ***
Resource    ../../Resources/Data.resource
Resource    ../../Resources/SwagLabs.resource
Test Setup  Open SwagLabs  ${URL}
Test Template   Log in happy


*** Test Cases ***
Login happy flow
    [Tags]  11A
    standard_user   secret_sauce
    problem_user  secret_sauce
    visual_user  secret_sauce

Login failure flow
    [Tags]  11B
    [Template]  Log in failure
    standard_user    wrong_pass     Epic sadface: Username and password do not match any user in this service
    wrong_user       secret_sauce   Epic sadface: Username and password do not match any user in this service
    locked_out_user  secret_sauce   Epic sadface: Sorry, this user has been locked out.

Login happy flow 2.0
    [Tags]  11C
    [Template]  Log in happy with automatic reset
    standard_user   secret_sauce
    problem_user  wrong_pass
    visual_user  secret_sauce


*** Keywords ***
Log in happy
    [Arguments]  ${user}  ${pass}
    Log in  ${user}  ${pass}
    Validate logged in   https://www.saucedemo.com/inventory.html
    [Teardown]  Log out

Log in happy with automatic reset
    [Arguments]  ${user}  ${pass}
    Log in  ${user}  ${pass}
    Validate logged in   https://www.saucedemo.com/inventory.html
    [Teardown]  Run Keyword If  '${KEYWORD_STATUS}'=='FAIL'  Reset  ELSE  Log out

Log in failure
    [Arguments]  ${user}  ${pass}  ${expected_error}
    Log in  ${user}  ${pass}
    Validate login error  ${expected_error}

Reset
    Close Browser
    Open SwagLabs  ${URL}