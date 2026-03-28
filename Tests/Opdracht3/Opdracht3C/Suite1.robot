*** Settings ***
Resource   Variables.resource


*** Test Cases ***
Test case 1 suite 1
    # Gebruik OF set global varible OF een variable resource file
    # Set Global Variable    ${GLOBAL}   Beschikbaar in beide suites
    Log To Console  ${GLOBAL}