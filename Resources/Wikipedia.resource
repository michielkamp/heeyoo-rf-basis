*** Settings ***
Library     Browser  enable_presenter_mode={"duration": "1 seconds", "width": "2px", "style": "dotted", "color": "blue"}


*** Keywords ***
Open Wikipedia
    [Arguments]  ${url}
    New Browser  chromium  headless=false  args=["--start-maximized"]  downloadsPath=C:\\Users\\Michiel\\Downloads
    New Context  viewport=${None}  acceptDownloads=true
    New Page     ${url}