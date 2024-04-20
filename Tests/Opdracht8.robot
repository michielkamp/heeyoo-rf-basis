*** Settings ***
Resource    ../Resources/Data.resource
Resource    ../Resources/RFDemoSite.resource
Library      RPA.Desktop
Test Setup  Open RF Demo Site  ${URL2}


*** Test Cases ***
Upload image file
    [Tags]  8A  withBrowser
    ${promise}  Promise To Upload File  C:/Users/Michiel/OneDrive/Pictures/incognito.png
    Browser.Click  id=chooseImage
    ${upload_result}  Wait For  ${promise}
    Get Element States    img.chosenImage  *=  attached

Upload using type keys
    [Tags]  8B  withKeys
    Browser.Click  id=chooseImage
    Sleep  2s
    RPA.Desktop.Type Text    C:\\Users\\Michiel\\OneDrive\\Pictures\\incognito.png   enter=true
    Get Element States    img.chosenImage  *=  attached


