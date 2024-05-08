*** Settings ***
Documentation       Test API

Resource            ../../resources/tasks/validacoes.resource
Library             RequestsLibrary
Library             Collections
Library             JSONLibrary


*** Variables ***
${URL}      https://gorest.co.in/
${RES}    value
${BASE_URL}    value
${headers}    value
${data}    value
${response.json()}    value
${ENDPOINT_ATUALIZAR}    value
${ENDPOINT_CRIAR}    value


*** Keywords ***
Que acesso a API para criação de usuário
    ${headers}=    Create Dictionary    Content-Type=application/json

Informo os campos obrigatórios
    ${data}=    Create Dictionary
    ...    id=6895773
    ...    name=Agnimitra Shukla
    ...    email=agnimitra_shukla@hane.example
    ...    gender=female
    ...    status=active.

O usuário é cadastrado com sucesso
    ${response}=    POST On Session    ${URL}   ${ENDPOINT_CRIAR}      json=${data}    headers=${headers}

    Should Be Equal    ${response}    201
    ${data}    Set Variable    value
    Dictionary Should Contain Sub Dictionary    ${response.json()}    ${data}

Acesso à API para atualização
    ${headers}=    Create Dictionary    Content-Type=application/json

Informo o email a ser atualizado
    ${data}=    Create Dictionary    email=new_tania@example.com

O email é atualizado com sucesso
    ${data}    Set Variable    value
    ${response}=    Put Request    Update Email    ${BASE_URL}  ${ENDPOINT_ATUALIZAR}    json=${data}    headers=${headers}
    Status Should Be    ${response}    200

o campo e-mail e atualizado
     Should Be Equal     ${response.json()}    email    tania@example.com    

Excluo um usuário existente
    ${response}=        Delete User        ${BASE_URL}/v2/todos    
    Status Should Be    ${response}    200


Acesso à API para exclusão
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${ENDPOINT_DEL}    Set Variable    value
    ${response}=    GET On Session   ${BASE_URL}  ${ENDPOINT_DEL}   headers=${headers}

Excluo um usuário existente
     [Arguments]    ${due_on}    ${status}
    ${response}    Set Variable    value
    Status Should Be    ${response}    200

    ${due_on}=    Get Value From Json    ${RES}    $[0].due_on

    Should Contain    ${response.json()}    ${due_on}

A exclusão ocorre com sucesso

    ${status}    Set Variable    value
    Should Be Equal    ${status}[0]    completed

 Dictionary Should Contain Key With Value
     [Arguments]    ${due_on}    # robotcode: ignore
    ...    ${response.json()}    due_on    2024-05-13T00:00:00.000+05:30
    ${due_on}    Set Variable    value
    Log To Console    ${\n}O Usuario foi excluido com sucesso ${due_on}


Delete User
    [Arguments]    ${arg1}
    # TODO: implement keyword "Delete User".
    Fail    Not Implemented



