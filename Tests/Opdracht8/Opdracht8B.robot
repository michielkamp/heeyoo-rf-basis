*** Settings ***
Library       Browser    enable_presenter_mode={"duration": "1 seconds", "width": "2px", "style": "dotted", "color": "blue"}
Test Setup    Open demo site


*** Variables ***
${URL}    https://michielkamp.github.io/heeyoo-rf-basis-demosite/


*** Test Cases ***
Start flaky process
    Wait Until Keyword Succeeds  5x  1s   Click and validate flaky process


*** Keywords ***
Open demo site
    New Browser  chromium  headless=false  args=["--start-maximized"]
    New Context  viewport=${None}
    New Page     ${URL}

Click and validate flaky process
    ${old}   Set Retry Assertions For    10s
    Log  ${old}
    Click  id=flakyProcess
    Get Url  ==  ${URL}processStarted.html