*** Settings ***
Library     RequestsLibrary


*** Variables ***
${base_url}=    https://reqres.in/


*** Test Cases ***
Get_User_Info
    create session    session     ${base_url}
    ${response}=   GET On Session   session     url=/api/users?page=2
    log to console  ${response.status_code}

