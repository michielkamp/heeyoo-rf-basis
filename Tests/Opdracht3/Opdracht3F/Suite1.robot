*** Settings ***
Library    Collections


*** Variables ***
@{LIST1}     Aap  Noot  Mies
&{DICT1}     Naam=Michiel   Leeftijd=45   Plaats=Veldhoven


*** Test Cases ***
List variabele
    @{LIST2}  Create List  Echo  Bravo  Charlie
    Log    ${LIST1}
    Log    ${LIST2}
    Log List  ${LIST1}
    Log List  ${LIST2}

Dictionary variable
    &{DICT2}  Create Dictionary  Naam=Pietje Puk  Leeftijd=8  Plaats=Amsterdam
    Log  ${DICT1}
    Log  ${DICT2}
    Log Dictionary    ${DICT1}
    Log Dictionary    ${DICT2}

 Log item in list
    Log  ${LIST1}[2]

 Log key in dictionary
    Log  ${DICT1}[Naam]
    Log  ${DICT1.Leeftijd}