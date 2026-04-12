*** Settings ***
Library       Browser    enable_presenter_mode={"duration": "1 seconds", "width": "2px", "style": "dotted", "color": "blue"}
Test Setup    Open demo site


*** Variables ***
${URL}    https://michielkamp.github.io/heeyoo-rf-basis-demosite/


*** Test Cases ***
Slow to be enabled
    Click   id=slowToEnable

Slow to be enabled with element state wait
    Wait For Elements State    id=slowToEnable   enabled   20
    Click  id=slowToEnable

Slow to be enabled with increased timeout
    Set Browser Timeout     20
    Click  id=slowToEnable


*** Keywords ***
Open demo site
    New Browser  chromium  headless=false  args=["--start-maximized"]
    New Context  viewport=${None}
    New Page     ${URL}