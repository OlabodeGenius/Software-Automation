*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DEMO_BLAZE_URL}    https://www.demoblaze.com/
${BROWSER}    chrome
${USERNAME}    your_username
${PASSWORD}    your_password

*** Test Cases ***
User Login and Logout
    Open Browser    ${DEMO_BLAZE_URL}    ${BROWSER}
    Maximize Browser Window

    # Click on Login button to open login modal
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Log in')]    timeout=10s
    Click Element    xpath=//a[contains(text(),'Log in')]

    # Wait for login modal to appear
    Wait Until Element Is Visible    xpath=//input[@id='loginusername']    timeout=10s

    # Fill in login details
    Input Text    xpath=//input[@id='loginusername']    ${USERNAME}
    Input Text    xpath=//input[@id='loginpassword']    ${PASSWORD}

    # Wait for login button to be enabled
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'Log in')]    timeout=5s
    Click Element    xpath=//button[contains(text(),'Log in')]

    # Wait for login to complete and logout button to appear
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Log out')]    timeout=20s

    # Click logout
    Click Element    xpath=//a[contains(text(),'Log out')]

    Sleep    3s  # Observe logout effect
    Capture Page Screenshot
    Close Browser
