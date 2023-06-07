*** Settings ***
Documentation    Testes de cadastro de tarefas

Resource    ${EXECDIR}/resources/base.robot
Resource    ${EXECDIR}/resources/pages/tasks.robot
Resource    ${EXECDIR}/resources/helpers.robot
Resource    ${EXECDIR}/resources/pages/login.robot





*** Test Cases ***
Deve poder cadastrar uma tarefa

    ${data}    Get fixture    tasks    create
   
   
    Create new user    ${data}[user]
    Login Session      ${data}[user]

    Go to task form
    Submit task form    ${data}[task]
    Task should be registered    ${data}[task][name]



    Sleep    10
    
Deve poder remover uma tarefa
    [Tags]    remove_task
    ${data}    Get fixture    tasks    remove

    Create new user    ${data}[user]
    Login Session      ${data}[user]

    Go to task form
    Submit task form             ${data}[task]
    Task should be registered    ${data}[task][name]
    Remove task                  ${data}[task][name]
    Task should not exist        ${data}[task][name]

Deve poder marcar uma tarefa como concluída
    [Tags]    finish_task
    ${data}    Get fixture    tasks    finish

    Create new user    ${data}[user]
    Login Session      ${data}[user]
    
    Go to task form
    Submit task form             ${data}[task]
    Task should be registered    ${data}[task][name]
    Finish task                  ${data}[task][name]
    Task should be finished      ${data}[task][name]

    Sleep    10





    
    



