*** Settings ***
Resource    ../resources/locators.robot
Resource    ../resources/keywords.robot
Suite Setup    Open AutomationExercise
Suite Teardown    Close Browser

*** Test Cases ***
Login Test
    [Documentation]    Verify that a user can log in successfully
    Login As Valid User
    Element Should Contain    ${LOGGED_USER}    Logged in as
