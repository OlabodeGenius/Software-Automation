*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot

*** Test Cases ***
User Sign Up
    Open Browser To DemoBlaze
    Click Element    xpath=//a[text()='Sign up']
    Wait Until Element Is Visible    id=sign-username
    Input Text    id=sign-username    ${USERNAME}
    Input Text    id=sign-password    ${PASSWORD}
    Click Button    xpath=//button[text()='Sign up']
    Sleep    2s
    Run Keyword And Ignore Error    Handle Alert
    Capture Page Screenshot
    Close Browser
