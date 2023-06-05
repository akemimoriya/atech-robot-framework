*** Settings ***
Documentation    Página de gestão de tarefas

Library  Browser
Library  String

*** Keywords ***

User should be logged in
    [Arguments]    ${name}

    ${splited_name}    Split String    ${name}
    ${element}         Set Variable    css=header small

    Wait For Elements State    ${element}    visible    5
    Get Text                   ${element}    equal      Olá, ${splited_name}[0]
