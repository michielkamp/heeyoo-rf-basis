*** Settings ***
Resource   Variables.resource


*** Test Cases ***
Test case 1 suite 3
    Log To Console  ${GLOBAL}
    Should Be Equal    ${GLOBAL}    Gewijzigde globale waarde