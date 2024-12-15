*** Settings ***
Library     Browser  enable_presenter_mode={"duration": "1 seconds", "width": "2px", "style": "dotted", "color": "blue"}
Test Setup  Open SwagLabs


*** Test Cases ***
Validate opened
    [Tags]  Happy
    Get Title   ==  Swag Labs

Login Test by ID
    [Tags]  2A  Happy
    Fill Text  id=user-name  standard_user
    Fill Text  id=password  secret_sauce
    Click      id=login-button
    Get Url  ==  https://www.saucedemo.com/inventory.html

Login Test by CSS
    [Tags]  2A  Happy
    Fill Text  [Placeholder=Username]  standard_user
    Fill Text  [Placeholder=Password]  secret_sauce
    Click      input.submit-button
    Get Url  ==  https://www.saucedemo.com/inventory.html

Login Test by Xpath
    [Tags]  2A  Happy  Xpath
    Fill Text  //input[@data-test="username"]  standard_user
    Fill Text  //input[@data-test="password"]  secret_sauce
    Click      //input[@value="Login"]
    Get Url  ==  https://www.saucedemo.com/inventory.html

Login Test by Text
    [Tags]  2A  Happy
    Fill Text  xpath=//input[@data-test="username"]  standard_user
    Fill Text  xpath=//input[@data-test="password"]  secret_sauce
    Click      text="Login"
    Get Url  ==  https://www.saucedemo.com/inventory.html

Login Fail
    [Tags]  2B  Sad
    Fill Text  id=user-name  standard_user
    Fill Text  id=password  wrong_password
    Click      id=login-button
    Get Text   h3[data-test="error"]  ==  Epic sadface: Username and password do not match any user in this service

Login with User Keyword
    [Tags]  2C  Happy
    Log in
    Get Url  ==  https://www.saucedemo.com/inventory.html


*** Keywords ***
Open SwagLabs
    New Browser  chromium  headless=false
    New Page     https://www.saucedemo.com/

Log in
    Fill Text  id=user-name  standard_user
    Fill Text  id=password  secret_sauce
    Click      id=login-button
	