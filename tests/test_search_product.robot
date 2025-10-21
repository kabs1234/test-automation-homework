*** Settings ***
Resource    ../resources/locators.robot
Resource    ../resources/keywords.robot
Suite Setup    Open AutomationExercise
Suite Teardown    Close Browser

*** Test Cases ***
Search Product Test
    [Documentation]    Verify that the product search returns relevant results.
    Go To Products Page
    Search For Product    dress
    Verify Search Results Contain    dress
