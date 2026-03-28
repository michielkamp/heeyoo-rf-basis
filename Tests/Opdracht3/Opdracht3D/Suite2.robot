*** Settings ***
Resource   Variables.resource


*** Test Cases ***
Test case 1 suite 2
    Log To Console  ${GLOBAL}

Test case 2 suite 2
    Set Global Variable    ${GLOBAL}  Gewijzigde globale waarde