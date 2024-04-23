*** Settings ***
Resource    ../Resources/Data.resource
Resource    ../Resources/Wikipedia.resource
Test Setup  Open Wikipedia  ${URL3}


*** Test Cases ***
Search Wikipedia
    Fill Text  id=searchInput  Robot Framework
    Click      xpath=//button[text()="Search"]      # Alternatief:  css=[class*=cdx-search-input__end-button]
    Get Text   id=firstHeading  ==  Robot Framework
    Get Text   id=mw-content-text  contains
    ...        Robot Framework is a generic test automation framework for acceptance testing and acceptance test-driven development (ATDD). It is a keyword-driven testing framework that uses tabular test data syntax.

Download article
    # Goto
