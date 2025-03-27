*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.demoblaze.com
${BROWSER}      Chrome
${USERNAME}     testuser@100
${PASSWORD}     testpass

*** Test Cases ***
Sign Up
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//a[@id='signin2']    10s
    Click Element    xpath=//a[@id='signin2']
    Wait Until Element Is Visible    xpath=//input[@id='sign-username']    10s
    Input Text       xpath=//input[@id='sign-username']    ${USERNAME}
    Input Text       xpath=//input[@id='sign-password']    ${PASSWORD}
    Click Button     xpath=//button[text()='Sign up']
    Wait Until Page Contains    Sign up successful    10s
    Close Browser

Sign Up - User Already Exists
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//a[@id='signin2']    10s
    Click Element    xpath=//a[@id='signin2']
    Wait Until Element Is Visible    xpath=//input[@id='sign-username']    10s
    Input Text       xpath=//input[@id='sign-username']    ${USERNAME}
    Input Text       xpath=//input[@id='sign-password']    ${PASSWORD}
    Click Button     xpath=//button[text()='Sign up']
    ${alert_text}=    Handle Alert    action=ACCEPT
    Should Be Equal    ${alert_text}    This user already exist.
    Close Browser

Log In
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//a[@id='login2']    10s
    Click Element    xpath=//a[@id='login2']
    Wait Until Element Is Visible    xpath=//input[@id='loginusername']    10s
    Input Text       xpath=//input[@id='loginusername']    ${USERNAME}
    Input Text       xpath=//input[@id='loginpassword']    ${PASSWORD}
    Click Button     xpath=//button[text()='Log in']
    Wait Until Page Contains    Welcome ${USERNAME}    10s
    Close Browser

Log In - Wrong Password
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//a[@id='login2']    10s
    Click Element    xpath=//a[@id='login2']
    Wait Until Element Is Visible    xpath=//input[@id='loginusername']    10s
    Input Text       xpath=//input[@id='loginusername']    ${USERNAME}
    Input Text       xpath=//input[@id='loginpassword']    wrongpassword
    Click Button     xpath=//button[text()='Log in']
    ${alert_text}=    Handle Alert    action=ACCEPT
    Should Be Equal    ${alert_text}    Wrong password.
    Close Browser

Log In - User Does Not Exist
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//a[@id='login2']    10s
    Click Element    xpath=//a[@id='login2']
    Wait Until Element Is Visible    xpath=//input[@id='loginusername']    10s
    Input Text       xpath=//input[@id='loginusername']    nonexistentuser
    Input Text       xpath=//input[@id='loginpassword']    wrongpassword
    Click Button     xpath=//button[text()='Log in']
    ${alert_text}=    Handle Alert    action=ACCEPT
    Should Be Equal    ${alert_text}    User does not exist.
    Close Browser

Log Out
    [Setup]    Run Keywords    Open Browser    ${URL}    ${BROWSER}
    ...    AND    Maximize Browser Window
    ...    AND    Wait Until Element Is Visible    xpath=//a[@id='login2']    10s
    ...    AND    Click Element    xpath=//a[@id='login2']
    ...    AND    Wait Until Element Is Visible    xpath=//input[@id='loginusername']    10s
    ...    AND    Input Text       xpath=//input[@id='loginusername']    ${USERNAME}
    ...    AND    Input Text       xpath=//input[@id='loginpassword']    ${PASSWORD}
    ...    AND    Click Button     xpath=//button[text()='Log in']
    Wait Until Element Is Visible    xpath=//a[@id='logout2']    10s
    Click Element    xpath=//a[@id='logout2']
    Wait Until Page Contains    Log in    10s
    Close Browser
