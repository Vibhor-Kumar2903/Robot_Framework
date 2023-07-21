*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${base_url}=    https://reqres.in


*** Test Cases ***
Get_User_Info
    create session    session     ${base_url}
    ${response}=   GET On Session   session     url=/api/users?page=2
    log to console  ${response.status_code}
#    log to console  ${response.content}

    # VALIDATION
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   200

    ${body}=    convert to string    ${response.content}
    should contain    ${body}   michael

    should contain    ${response.headers}     Content-Type

    ${contentTypeValue}=     Get From Dictionary    ${response.headers}     Content-Type
    log to console      ${contentTypeValue}



