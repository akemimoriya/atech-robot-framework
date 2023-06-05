*** Settings ***
Documentation    Cenários de testes do Login

Resource    ${EXECDIR}/resources/base.robot


*** Test Cases ***
Deve poder logar com sucesso
        [Tags]        smoke

        &{user}        Create Dictionary    
        ...            name=Jorge Mitsuo Moriya    
        ...            email=jorge.mitsuo@gmail.com    
        ...            password=123456
        
        Create new user    ${user}

        Start Session
        Go to Login page
        Submit login form       ${user}

        User should be logged in    ${user}[name]

Não deve logar com senha incorreta
        &{user1}        Create Dictionary    
        ...            name=Marli Oikawa
        ...            email=marli.oikawa@gmail.com    
        ...            password=123456

        &{user2}        Create Dictionary    
        ...            name=Marli Oikawa
        ...            email=marli.oikawa@gmail.com    
        ...            password=pwd456

        Create new user    ${user1}

        Start Session
        Go to Login page
        Submit login form       ${user2}

        Notice should be        Ocorreu um erro ao fazer login, verifique suas credenciais.