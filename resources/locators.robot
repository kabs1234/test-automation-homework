*** Variables ***
${URL}             https://automationexercise.com/
${LOGIN_BTN}       xpath=//a[text()=" Signup / Login"]
${EMAIL_INP}       xpath=//input[@data-qa="login-email"]
${PASSWORD_INP}    xpath=//input[@data-qa="login-password"]
${SUBMIT_LOGIN}    xpath=//button[@data-qa="login-button"]
${LOGGED_USER}     xpath=//a[contains(text(),"Logged in as")]
${LOGOUT_BTN}      xpath=//a[text()=" Logout"]

${SEARCH_INPUT}            //input[@id='search_product']
${SEARCH_BUTTON}           //button[@id='submit_search']
${SEARCH_RESULT_SECTION}   //div[@class='features_items']

${PRODUCTS_LINK}   xpath=//a[text()=" Products"]
${FIRST_PRODUCT}   xpath=(//a[contains(text(),"Add to cart")])[1]
${VIEW_CART_BTN}   xpath=//u[text()="View Cart"]
${CART_ITEM}       xpath=//td[@class="cart_description"]

${CONTACT_LINK}    xpath=//a[text()=" Contact us"]
${CONTACT_NAME}    xpath=//input[@data-qa="name"]
${CONTACT_EMAIL}   xpath=//input[@data-qa="email"]
${CONTACT_SUBJECT}   xpath=//input[@data-qa="subject"]
${CONTACT_MSG}     xpath=//textarea[@data-qa="message"]
${CONTACT_SUBMIT}  xpath=//input[@data-qa="submit-button"]
${SUCCESS_MSG}     xpath=//div[@class="status alert alert-success"]
