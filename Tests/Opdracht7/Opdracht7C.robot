*** Settings ***
Resource    ../../Resources/Data.resource
Resource    ../../Resources/SwagLabs.resource
Test Setup  Open SwagLabs  ${URL}


*** Variables ***
&{naw}    naam=Kamp    voornaam=Michiel    postcode=5501JB


*** Test Cases ***
Voeg toe aan winkelmand
    Log in    ${USER}    ${PASS}
    Add to cart v3    Sauce Labs Backpack  1
    Add to cart v3    Sauce Labs Bolt T-Shirt  2
    Open cart
    Validate orders in cart   Sauce Labs Backpack    Sauce Labs Bolt T-Shirt

Plaats bestelling
    Log in    ${USER}    ${PASS}
    Set order state
    Open cart
    Checkout    ${naw}