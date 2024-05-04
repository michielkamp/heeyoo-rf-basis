*** Settings ***
Library  Collections


*** Variables ***
@{LIST}  Aap  Noot  Mies
&{DICT}  Naam=Michiel  Leeftijd=44  Woonplaats=Veldhoven


*** Test Cases ***
Log list and dictionary from variables
    [Tags]  3E
    Log list  ${LIST}
    Log dictionary  ${DICT}

Create and log locally created
    [Tags]  3E
    @{local_list}  Create List  Kwik  Kwek  Kwak
    &{local_dict}  Create Dictionary  Naam=Donald  Leeftijd=90  Woonplaats=Duckstad
    Log list  ${local_list}
    Log Dictionary  ${local_dict}

Validate specific items
    [Tags]  3F
    Should be equal  ${LIST}[2]  Mies
    should be equal  ${DICT}[Naam]  Michiel


