*** Settings ***
Resource    ../../Resources/Data.resource
Resource    ../../Resources/SwagLabs.resource
Library     DataDriver  ./Testdata.csv
Test Setup  Open SwagLabs  ${URL}
Test Template  Data-driven login tests


*** Test Cases ***
Login with ${user}


*** Keywords ***
Data-driven login tests
    [Arguments]  ${user}  ${pass}  ${expected_error}
    [Tags]  11E
    Log in  ${user}  ${pass}
    IF  '${expected_error}'!='${EMPTY}'
        Validate login error  ${expected_error}
    ELSE
        Validate logged in  https://www.saucedemo.com/inventory.html
        Log out
    END
    [Teardown]  Run Keyword If  '${KEYWORD_STATUS}'=='FAIL'  Reset

Reset
    Close Browser
    Open SwagLabs  ${URL}