*** Settings ***
Resource    ../../Resources/Data.resource
Resource    ../../Resources/SwagLabs.resource
Test Setup  Open SwagLabs  ${URL}


*** Test Cases ***
Voeg toe aan winkelwagen
    Log in    ${USER}    ${PASS}
    Add to cart v1
