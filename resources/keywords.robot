*** Settings ***
Library    SeleniumLibrary
Resource   locators.robot

*** Keywords ***
Open AutomationExercise
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Login As Valid User
    Click Element    ${LOGIN_BTN}
    Input Text       ${EMAIL_INP}       aikhan_test@example.com
    Input Text       ${PASSWORD_INP}    12345678
    Click Element    ${SUBMIT_LOGIN}
    Wait Until Element Is Visible    ${LOGGED_USER}    5s

Logout
    Click Element    ${LOGOUT_BTN}
    Wait Until Element Is Visible    ${LOGIN_BTN}    2s

Go To Products Page
    Click Element    ${PRODUCTS_LINK}
    Wait Until Page Contains Element    ${SEARCH_INPUT}    2s

Search For Product
    [Arguments]    ${product_name}
    Input Text    ${SEARCH_INPUT}    ${product_name}
    Click Element    ${SEARCH_BUTTON}
    Wait Until Page Contains Element    ${SEARCH_RESULT_SECTION}    2s

Verify Search Results Contain
    [Arguments]    ${expected_text}
    ${results}=    Get Text    ${SEARCH_RESULT_SECTION}
    Should Contain    ${results.lower()}    ${expected_text.lower()}

Send Contact Message
    Click Element    ${CONTACT_LINK}
    Input Text       ${CONTACT_NAME}     Aikhan
    Input Text       ${CONTACT_EMAIL}    aikhan@example.com
    Input Text       ${CONTACT_SUBJECT}  Test Subject
    Input Text       ${CONTACT_MSG}      Hello, this is a test message.
    Click Element    ${CONTACT_SUBMIT}
    Wait Until Element Is Visible        ${SUCCESS_MSG}    2s

*** Keywords ***
Handle Any Alert
    [Documentation]    Accepts alert if present, otherwise continues.
    TRY
        Handle Alert
        Log    Alert handled successfully.
    EXCEPT
        Log    No alert present, continuing test.
    END

*** Keywords ***
Remove Blocking Ads
    ${ads}=    Get WebElements    //div[starts-with(@id, "aswift") or contains(@id, "google_ads") or contains(@id, "ad-container")]
    FOR    ${ad}    IN    @{ads}
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${ad}
        IF    ${is_visible}
            ${ad_id}=    Get Element Attribute    ${ad}    id
            Log    Removing blocking ad with id: ${ad_id}
            Execute JavaScript    var el=document.getElementById('${ad_id}'); if(el) el.remove();
        END
    END
