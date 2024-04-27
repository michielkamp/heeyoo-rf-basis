*** Settings ***
Resource  Variabelen.resource


*** Variables ***
${SUITE1}  Beschikbaar alleen in suite1


*** Test Cases ***
Test case 1 suite 1
    Set Test Variable  ${TEST1}  Alleen beschikbaar in test case 1     #    VAR  ${TEST1}  Alleen beschikbaar in test case 1  scope=TEST
    Log to Console  ${GLOBAAL}
    Log To Console  ${SUITE1}
    User keyword

Test case 2 suite 1
    User keyword


*** Keywords ***
User keyword
    Log To Console   ${TEST1}