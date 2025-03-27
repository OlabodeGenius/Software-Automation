*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot

*** Test Cases ***
User Log In
    [Documentation]    Test logging into the DemoBlaze website.

    # Step 1: Open the browser and navigate to the website
    Open Browser To DemoBlaze

    # Step 2: Click on the 'Log in' button to open the login modal
    Click Element    xpath=//a[text()='Log in']

    # Step 3: Wait until the username input field is visible
    Wait Until Element Is Visible    id=loginusername

    # Step 4: Enter the username and password
    Input Text    id=loginusername    ${USERNAME}
    Input Text    id=loginpassword    ${PASSWORD}

    # Step 5: Click on the 'Log in' button inside the modal
    Click Button    xpath=//button[text()='Log in']

    # Step 6: Handle any possible alerts (e.g., wrong password)
    Run Keyword And Ignore Error    Handle Alert  accept=True

    # Step 7: Wait for 3 seconds to allow login processing (adjust if needed)
    Sleep    3s

    # Step 8: Capture a screenshot for debugging purposes
    Capture Page Screenshot

    # Step 9: Close the browser to end the test
    Close Browser
