*** Settings ***
Resource    ../Resources/Data.resource
Resource    ../Resources/SwagLabs.resource
Test Setup  Open SwagLabs  ${URL}


*** Test Cases ***
Doe een bestelling
    Log in    ${USER}    ${PASS}
    Add to cart  Sauce Labs Backpack   1
    Validate orders in cart   Sauce Labs Backpack
    Close cart
    Add to cart  Sauce Labs Bolt T-Shirt   2
    Validate orders in cart   Sauce Labs Backpack   Sauce Labs Bolt T-Shirt