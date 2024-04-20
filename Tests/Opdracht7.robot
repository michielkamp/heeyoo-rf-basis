*** Settings ***
Resource    ../Resources/Data.resource
Resource    ../Resources/RFDemoSite.resource
Test Setup  Open RF Demo Site  ${URL2}


*** Test Cases ***
Handle alert box
    [Tags]  7A  Alert
    ${promise}  Promise To  Wait For Alert  action=accept
    Click  id=alertPopup
    ${text}  Wait For  ${promise}
    Should Be Equal  ${text}  Hallo!

Klik de disabled knop
    [Tags]  7B  Disabled
    ${original}  Set Retry Assertions For  0:00:05
    Wait For Elements State  id=slowToEnable  enabled
    Click  id=slowToEnable
    Set Retry Assertions For  ${original}
    Get Text  id=slowEnableResult  ==  Button clicked!

Start het flaky process
    [Tags]  7C  Flaky
    ${original}  Set Retry Assertions For  0:00:05
    Wait Until Keyword Succeeds  5x  1s  Start process
    Set Retry Assertions For  ${original}


*** Keywords ***
Start process
    Click  id=flakyProcess
    Get Text  css=h1  ==  Process started

