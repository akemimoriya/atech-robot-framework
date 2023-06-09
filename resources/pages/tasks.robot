*** Settings ***
Documentation    Página de gestão de tarefas

Library  Browser
Library  String

*** Keywords ***
Go to task form

    Click    css=a[href$=create]

    Wait For Elements State    
    ...    css=h1 >> text=Cadastrar Tarefa    
    ...    visible        5

Submit task form
    [Arguments]     ${task}
    Fill Text       css=input[placeholder$=tarefa]   ${task}[name]

    FOR  ${tag}  IN  @{task}[tags]
        Fill Text       css=input[name=tags]             ${tag}
        Keyboard Key    press    Enter
    END

    Click        css=button[type=submit] >> text=Cadastrar

Task should be registered
    [Arguments]    ${task_name}

    Wait For Elements State    
    ...                  css=.task-item >> text=${task_name}
    ...                  visible    5

Remove task
    [Arguments]    ${task_name}
    
    Click    xpath=//Strong[text()="${task_name}"]/..//button[@class="task-remove"]
    ...    
Task should not exist
    [Arguments]    ${task_name}

    Wait For Elements State    
    ...                  css=.task-item >> text=${task_name}
    ...                  detached    5    

Finish task
    [Arguments]    ${task_name}
    
    Click    xpath=//Strong[text()="${task_name}"]/..//button[@class="item-toggle"]

Task should be finished
    [Arguments]    ${task_name}

    Wait For Elements State    
    ...                  css=.task-done >> text=${task_name}
    ...                  detached    5    