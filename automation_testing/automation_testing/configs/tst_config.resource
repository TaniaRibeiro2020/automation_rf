*** Settings ***
Documentation   Global settings

Library    OperatingSystem
Library    RequestsLibrary
Library    JSONLibrary
Library    XML
Library    FakerLibrary


*** Variables ***
${REQUESTS_DIR}                         ${EXECDIR}${/}resources${/}json${/}gorest
${URL}                                  gorest.co.in/public

# API DE TESTE
${ENDPOINT_CRIAR}                       /v2/users
${ENDPOINT_VISUALIZAR}                  /v2/users/2931751
${ENDPOINT_ATUALIZAR}                   /v2/users/2931751
${ENDPOINT_DEL}                         /v2/todos