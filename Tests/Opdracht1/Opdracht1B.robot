*** Settings ***
Library     Browser

*** Test Cases ***
Opdracht1B
    New Browser     chromium    headless=false
    New Page        https://www.saucedemo.com
    Get Title   ==  Swag Labs