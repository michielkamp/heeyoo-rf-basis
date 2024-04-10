*** Settings ***
Library     Browser  enable_presenter_mode={"duration": "1 seconds", "width": "2px", "style": "dotted", "color": "blue"}
Test Setup  Open SwagLabs


*** Variables ***
${USER}  	standard_user
${PASS}  	secret_sauce
${WRONG_PASS}  	wrong_password
${URL}		https://www.saucedemo.com/


*** Test Cases ***
Login Test by ID
    ${url}  Log in  ${USER}  ${PASS}
    Should Be Equal  ${url}  https://www.saucedemo.com/inventory.html

Login Fail
    Log in  ${USER}  ${WRONG_PASS}
    Get Text   h3[data-test="error"]  ==  Epic sadface: Username and password do not match any user in this service


*** Keywords ***
Open SwagLabs
    New Browser  chromium  headless=false
    New Page     ${URL}
    Log  	 Logging in with "${USER}"

Log in
    [Arguments]  ${user}  ${pass}
    Fill Text  id=user-name  ${user}
    Fill Text  id=password  ${pass}
    Click      id=login-button
    ${url}  Get Url
    RETURN  ${url}
	