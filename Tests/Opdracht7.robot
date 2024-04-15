*** Settings ***
Resource    ../Resources/Data.resource
Resource    ../Resources/RFDemoSite.resource
Test Setup  Open RF Demo Site  ${URL2}


*** Test Cases ***
Handle alert box
    [Tags]  Alert
    Click  id=alertPopup
    Sleep  5s

Klik de disabled knop
    [Tags]  Disabled
    ${original}  Set Retry Assertions For  0:00:05
    Wait For Elements State  id=slowToEnable  enabled
    Click  id=slowToEnable
    Set Retry Assertions For  ${original}

Start het flaky process
    [Tags]  Flaky
    Wait Until Keyword Succeeds  5x  1s  Start process


*** Keywords ***
Start process
    Click  id=flakyProcess
    Get Text  css=h1  equals  Process started

