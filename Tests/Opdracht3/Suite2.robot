*** Settings ***
Resource  Variabelen.resource


*** Test Cases ***
Test case 1 suite 2
    Log To Console  ${GLOBAAL}
    Variable Should Not Exist  ${SUITE1}
    Set Global Variable    ${GLOBAAL}   Nieuwe waarde     #    VAR  ${GLOBAAL}  Alleen beschikbaar in test case 1  scope=GLOBAL

Test case 2 suite 2
    Log To Console   ${GLOBAAL}