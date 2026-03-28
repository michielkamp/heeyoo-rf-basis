*** Settings ***
Library     Browser
Test Setup  Open Swag Labs


*** Test Cases ***
Login Test by ID
    Fill Text  id=user-name  standard_user
    Fill Text  id=password  secret_sauce
    Click      id=login-button
    Get Url  ==  https://www.saucedemo.com/inventory.html

Login Test by CSS
    Fill Text  [Placeholder=Username]  standard_user
    Fill Text  [Placeholder=Password]  secret_sauce
    Click      input.submit-button
    Get Url  ==  https://www.saucedemo.com/inventory.html

Login Test by Xpath
    Fill Text  //input[@data-test="username"]  standard_user
    Fill Text  //input[@data-test="password"]  secret_sauce
    Click      //input[@value="Login"]
    Get Url  ==  https://www.saucedemo.com/inventory.html

Login Test by Text
    Fill Text  xpath=//input[@data-test="username"]  standard_user
    Fill Text  xpath=//input[@data-test="password"]  secret_sauce
    Click      text="Login"     # alleen de button kan met de text strategie
    Get Url  ==  https://www.saucedemo.com/inventory.html


*** Keywords ***
Open Swag Labs
    New Browser     chromium    headless=false
    New Page        https://www.saucedemo.com