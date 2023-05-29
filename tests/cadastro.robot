*** Settings ***
Resource    ../resources/base.robot
#...    ${EXECDIR}/resources/base.robot
Resource    ../resources/pages/signup.robot
#...    ../resources/base.robot

*** Test Cases ***
Deve cadastrar um novo usuário

        &{user}=        Create Dictionary    
        ...    name=Akemi Moriya    
        ...    email=akemimoriya@gmail.com    
        ...    password=123456
        
        Remove User By Email    ${user}[email]
        Start Session
        Go to signup
        Register user           ${user}

        Notice should be        Boas vindas ao Mark85, o seu gerenciador de tarefas.

Usuário duplicado
    [Tags]    dup

         &{user}=        Create Dictionary    
         ...    name=Luciano Oikawa    
         ...    email=luciano.oikawa@gmail.com    
         ...    password=123456
         
         Remove User By Email    ${user}[email]
         Start Session
         Go to signup
         Register user           ${user}
         Register user           ${user}
         Notice should be        Oops! Já existe um cadastro com e-mail informado.
Nome deve ser obrigatório
    [Tags]    semNome

         &{user}=        Create Dictionary    
         ...    name=
         ...    email=missako.moriya@gmail.com    
         ...    password=123456
         
         Start Session
         Go to signup
         Register user            ${user}
         Alert should be          Informe seu nome completo

Email deve ser obritatório
    [Tags]    semEmail

         &{user}=        Create Dictionary    
         ...    name=Missako Moriya
         ...    email=
         ...    password=123456
         
         Start Session
         Go to signup
         Register user            ${user}
         Alert should be          Informe seu e-email
Senha deve ser obrigatória
    [Tags]    semSenha

         &{user}=        Create Dictionary    
         ...    name=Missako Moriya
         ...    email=issako.moriya@gmail.com    
         ...    password=
         
         Start Session
         Go to signup
         Register user            ${user}
         Alert should be          Informe uma senha com pelo menos 6 digitos

Senha com menos de 6 dígitos
    [Tags]    semMenos

         &{user}=        Create Dictionary    
         ...    name=Missako Moriya
         ...    email=issako.moriya@gmail.com    
         ...    password=12345
         
         Start Session
         Go to signup
         Register user            ${user}
         Alert should be          Informe uma senha com pelo menos 6 digitos



