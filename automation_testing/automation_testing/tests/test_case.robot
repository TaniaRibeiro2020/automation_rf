
*** Settings ***
Resource    ../resources/tasks/validacoes.resource  # Certifique-se de que o caminho está correto

*** Test Cases ***
Scenario: Create a New User
    [Documentation]    Testa a criação de um novo usuário com POST.
    Given Que acesso a API para criação de usuário
    When Informo os campos obrigatórios
    Then O usuário é cadastrado com sucesso

Scenario: Update User Email
    [Documentation]    Testa a atualização do email do usuário.
    Given Acesso à API para atualização
    When Informo o email a ser atualizado
    Then O email é atualizado com sucesso

Scenario: Delete User
    [Documentation]    Testa a exclusão de um usuário.
    Given Acesso à API para exclusão
    When Excluo um usuário existente    
    Then A exclusão ocorre com sucesso
