*** Settings ***
Library    Collections


*** Variables ***
&{DICT1}     Naam=Michiel   Leeftijd=45   Plaats=Veldhoven


*** Test Cases ***
Log key in dictionary
    Set Test Variable    ${key}  Naam
    Should Be Equal  ${DICT1}[${key}]   Michiel