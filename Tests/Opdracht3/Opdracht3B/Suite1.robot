*** Variables ***
${SUITE1}  Beschikbaar alleen in suite1


*** Test Cases ***
Test case 1 suite 1
    Set Test Variable   ${test1}  Beschikbaar alleen in test1
    Log To Console  ${SUITE1}
    Log To Console  ${test1}

Test case 2 suite 1
    Log To Console  ${SUITE1}
    Variable Should Not Exist  ${test1}