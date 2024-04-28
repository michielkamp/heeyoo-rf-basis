*** Settings ***
Documentation   API TESTEN: opgaven GET en POST request
Resource        ../Resources/Data.resource
Library         RequestsLibrary
Library         Collections


*** Test Cases ***
Get User Email Using Session
    Create Session     basisurl    ${BASE_URL}
    ${response}=      Get On Session    basisurl    /users/1
    Should Be Equal As Strings    ${response.status_code}    200
    ${json}=          Set Variable    ${response.json()}
    ${value}=         Get From Dictionary    ${json}    email    default
    Log               ${value}
    Should Be Equal As Strings    ${value}    Sincere@april.biz

Create New Post
    [Teardown]    Delete All Sessions
    Create Session    basisurl    ${BASE_URL}
    &{headers}=       Create Dictionary   Content-Type=application/json
    &{data}=          Create Dictionary   title=Iets   body=nog iets   userId=1
    ${response}=      Post On Session     basisurl    /posts    json=${data}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201
    ${json}           Set Variable    ${response.json()}
    ${title}=         Get From Dictionary    ${json}    title    default
    Should Be Equal As Strings    ${title}    Iets