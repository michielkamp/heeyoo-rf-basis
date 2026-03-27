*** Settings ***
Library     Browser


*** Test Cases ***
Opdracht1C
    New Browser     chromium    headless=false
    New Page        https://www.saucedemo.com
    Get Title   ==  Swag Labsssss
    Log To Console  Er is iets fout gegaan