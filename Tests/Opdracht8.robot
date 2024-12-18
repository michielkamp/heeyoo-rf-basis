*** Settings ***
Resource    ../Resources/Data.resource
Resource    ../Resources/RFDemoSite.resource
Test Setup  Open RF Demo Site  ${URL2}

Library    Telnet

*** Test Cases ***
Handle alert box
    [Tags]  8A  Alert
    ${promise}  Promise To  Wait For Alert  action=accept
    Click  id=alertPopup
    ${text}  Wait For  ${promise}
    Should Be Equal  ${text}  Hallo!

Klik de disabled knop
    [Tags]  8B  Disabled
    Wait For Elements State  id=slowToEnable  enabled  15 seconds
#    ${original}  Set Browser Timeout    15s
#    Log To Console    ${original}
    Click  id=slowToEnable
    Get Text  id=slowEnableResult   ==    Button clicked!

Start het flaky process
    [Tags]  8C  Flaky
    Wait Until Keyword Succeeds  5x  1s  Start process


*** Keywords ***
Start process
    Click  id=flakyProcess
    Get Text  css=h1  ==  Process started!!

