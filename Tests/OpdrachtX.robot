*** Settings ***
Resource    ../Resources/Data.resource
Resource    ../Resources/Wikipedia.resource
Library     OperatingSystem
Library     RPA.PDF
Library     String
Test Setup  Open Wikipedia  ${URL3}


*** Test Cases ***
Search Wikipedia
    [Tags]  Opdracht11A  Wikipedia zoeken
    [Setup]  Open Wikipedia    $url
    Fill Text  id=searchInput  Robot Framework
    Click      xpath=//button[text()="Search"]      # Alternatief:  css=[class*=cdx-search-input__end-button]
    Get Text   id=firstHeading  ==  Robot Framework
    Get Text   id=mw-content-text  contains
    ...        Robot Framework is a generic test automation framework for acceptance testing and acceptance test-driven development (ATDD). It is a keyword-driven testing framework that uses tabular test data syntax.

Download article
    [Tags]  Opdracht11B  Download
    [Setup]  Open Wikipedia    https://en.wikipedia.org/wiki/Robot_Framework
    ${filename}  Download article
    Should Be Equal     ${filename}  Robot_Framework.pdf
    [Teardown]  Remove File   ${DOWNLOAD_ROOT}/Robot_Framework.pdf

Validate PDF
    [Tags]  Opdracht11C  Validate_download
    [Setup]  Open Wikipedia    https://en.wikipedia.org/wiki/Robot_Framework
    ${filename}  Download article
    Validate PDF  ${filename}
    [Teardown]  Close open PDF  ${filename}


*** Keywords  ***
Close open PDF
    [Arguments]  ${filename}
    Close PDF
    Remove File   ${DOWNLOAD_ROOT}/${filename}
