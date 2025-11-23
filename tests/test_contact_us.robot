*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Resource   ../resources/locators.robot

*** Test Cases ***
Contact Us Test
    [Documentation]    Verify that the contact form submission works correctly.
    Open Browser    https://automationexercise.com/    chrome
    Maximize Browser Window
    Handle Cookie Consent
    Click Element    xpath=//a[text()=' Contact us']
    Wait Until Element Is Visible    xpath=//input[@data-qa='name']    1s
    Input Text    xpath=//input[@data-qa='name']       Aikhan
    Input Text    xpath=//input[@data-qa='email']      aikhan_test@example.com
    Input Text    xpath=//input[@data-qa='subject']    Test Subject
    Input Text    xpath=//textarea[@data-qa='message']  This is a test message.

    # Remove any blocking ads before clicking
    Remove Blocking Ads

    Click Button    xpath=//input[@data-qa='submit-button']

    Handle Any Alert
    Wait Until Page Contains    Success! Your details have been submitted successfully.    2s
    Close Browser
