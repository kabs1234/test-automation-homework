*** Settings ***
Resource    ../resources/locators.robot
Resource    ../resources/keywords.robot
Suite Setup    Open AutomationExercise
Suite Teardown    Close Browser

*** Test Cases ***
Logout Test
    [Documentation]    Verify user can log out successfully
    Login As Valid User
    Logout
    Page Should Contain    Login to your account
