*** Settings ***
Library     Browser   #enable_presenter_mode={"duration": "1 seconds", "width": "2px", "style": "dotted", "color": "blue"}
Library     OperatingSystem

*** Keywords ***
Open RF Demo Site
    [Arguments]  ${url}
    New Browser  chromium  headless=false  args=["--start-maximized"]  downloadsPath=C:\\Users\\Michiel\\Downloads
    New Context  viewport=${None}  acceptDownloads=true
    New Page     ${url}

Download file
    ${dl_promise}  Promise To Wait For Download  /pycharm-community.exe
    Click  id=downloadFile
    ${file_obj}  Wait For  ${dl_promise}
    File Should Exist      ${file_obj}[saveAs]
    Should Be True         ${file_obj.suggestedFilename}