*** Settings ***
Resource    Data.resource
Library     Browser  enable_presenter_mode={"duration": "1 seconds", "width": "2px", "style": "dotted", "color": "blue"}
Library     OperatingSystem
Library     RPA.PDF


*** Keywords ***
Open Wikipedia
    [Arguments]  ${url}
    New Browser  chromium  headless=false  args=["--start-maximized"]  downloadsPath=C:\\Users\\Michiel\\Downloads
    New Context  viewport=${None}  acceptDownloads=true
    New Page     ${url}

Download article
    Click  id=vector-page-tools-dropdown
    Click  text=Download as PDF
    ${dl_promise}  Promise To Wait For Download  saveAs=Robot_Framework.pdf
    Click  //span[text()='Download']
    ${file_obj}  Wait For  ${dl_promise}
    File Should Exist   ${file_obj.saveAs}
    [Return]  ${file_obj.suggestedFilename}

Validate PDF
    [Arguments]  ${filename}
    ${text}  Get text from PDF  ${DOWNLOAD_ROOT}/${filename}
    Should start with  ${text}[${1}]  Robot FrameworkRobot Framework is a generic test automation framework for\nacceptance  testing  and  acceptance  test-driven  development