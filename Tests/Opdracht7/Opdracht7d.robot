*** Settings ***
Resource    ../../Resources/Data.resource
Resource    ../../Resources/SwagLabs.resource
Test Setup  Open SwagLabs  ${URL}


*** Variables ***
@{list}   Sauce Labs Backpack    Sauce Labs Bolt T-Shirt


*** Test Cases ***
Maak een bestelling
    Log in    ${USER}    ${PASS}
    Add to cart v3  Sauce Labs Backpack  1
    Open cart
    Validate orders in cart   Sauce Labs Backpack
    Close cart
    Add to cart v3  Sauce Labs Bolt T-Shirt  2
    Open cart
    Validate orders in cart   @{list}
    Close cart