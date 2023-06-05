*** Settings ***
Documentation        Tudo começa aqui

Library      Browser
Library      libs/mongo.py

Resource     pages/components.robot
Resource     pages/signup.robot
Resource     pages/login.robot
Resource     pages/tasks.robot
Resource     helpers.robot

*** Keywords ***
Start Session

        New Browser     browser=chromium    headless=False
        New Page        http://localhost:3000
