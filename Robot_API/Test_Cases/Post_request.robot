*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${base_url}=    https://reqres.in/


*** Test Cases ***
Creat_User
    create session    session     ${base_url}
    ${body}=    create dictionary    email=name.holt@reqres.in   password=pistol
    ${header}=     create dictionary    Content-Type=application/json

    ${response}=   POST On Session    session     url=/api/register    data=${body}    headers=${header}
    log to console    ${response.status_code}







