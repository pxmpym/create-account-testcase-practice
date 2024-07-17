*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser    ${URL}        chrome
Test Teardown    Close Browser

*** Variables ***
${URL}    D:\MyPractice\\simple-testcase\\create-account.html    
${INPUT USERNAME}    xpath://*[@id="username"]
${INPUT FIRSTNAME}    xpath://*[@id="firstname"]
${INPUT LASTNAME}    xpath://*[@id="lastname"]
${INPUT PASSWORD}    xpath://*[@id="password"]
${INPUT CONFIRM PASSWORD}    xpath://*[@id="confirmPassword"]
${CREATE ACCOUNT BTN}    xpath://*[@id="create-account-form"]/input
${SUCCESS TOAST MSG}    xpath://*[@id="toast"]/div[contains(text(), 'สร้างบัญชีสำเร็จ')]
${FAILED TOAST MSG}    xpath://*[@id="toast"]/div[contains(text(), 'ไม่สามารถสร้างบัญชีได้ กรุณากรอกข้อมูลให้ถูกต้อง')]  
${EMPTY USERNAME MSG}    xpath://*[@id="create-account-form"]/div[1]/div[contains(text(), 'กรุณากรอกชื่อผู้ใช้')]     
${EMPTY FIRSTNAME MSG}    xpath://*[@id="create-account-form"]/div[2]/div[contains(text(), 'กรุณากรอกชื่อ')] 
${EMPTY LASTNAME MSG}    xpath://*[@id="create-account-form"]/div[3]/div[contains(text(), 'กรุณากรอกนามสกุล')]  
${EMPTY PASSWORD MSG}    xpath://*[@id="create-account-form"]/div[4]/div[contains(text(), 'กรุณากรอกรหัสผ่าน')]     
${EMPTY CONFIRM PASSWORD MSG}    xpath://*[@id="create-account-form"]/div[5]/div[contains(text(), 'กรุณายืนยันรหัสผ่าน')]  
${USERNAME WARNING}    xpath://*[@id="create-account-form"]/div[1]/div[contains(text(), 'ชื่อผู้ใช้ไม่ควรเกิน 20 ตัวอักษร')]   
${PASSWORD WARNING}    xpath://*[@id="create-account-form"]/div[4]/div[contains(text(), 'รหัสผ่านต้องมีอย่างน้อย 8 ตัวอักษร')]  
${PASSWORD MISMATCHED MSG}    xpath://*[@id="create-account-form"]/div[5]/div[contains(text(), 'รหัสผ่านไม่ตรงกัน')]   


*** Test Cases ***

CREATE_ACCOUNT_01: User create account with valid data should success
    Fill data to form and click button "Create Account"     tangmo1    water    melon    12345678    12345678
    Element Should Be Visible    ${SUCCESS TOAST MSG}    

CREATE_ACCOUNT_02: "User create account with blank username should failed
    Fill data to form and click button "Create Account"     ${EMPTY}    somoh    sour   12345678    12345678
    Element Should Be Visible    ${EMPTY USERNAME MSG}
    Element Should Be Visible    ${FAILED TOAST MSG} 

CREATE_ACCOUNT_03: User create account with blank first name should failed
    Fill data to form and click button "Create Account"     lumyai1    ${EMPTY}   sweet   12345678    12345678
    Element Should Be Visible   ${EMPTY FIRSTNAME MSG} 
    Element Should Be Visible     ${FAILED TOAST MSG}     

CREATE_ACCOUNT_04: User create account with blank last name should failed
    Fill data to form and click button "Create Account"     chomphu1    chomphu   ${EMPTY}   12345678    12345678
    Element Should Be Visible   ${EMPTY LASTNAME MSG}
    Element Should Be Visible     ${FAILED TOAST MSG}     

CREATE_ACCOUNT_05: User create account with blank password should failed
    Fill data to form and click button "Create Account"     melon1    melon   lonme   ${EMPTY}    12345678
    Element Should Be Visible   ${EMPTY PASSWORD MSG}
    Element Should Be Visible    ${PASSWORD MISMATCHED MSG}
    Element Should Be Visible     ${FAILED TOAST MSG}    

CREATE_ACCOUNT_06: User create account with blank confirm password should failed
    Fill data to form and click button "Create Account"     mango1    mango   gomang   12345678    ${EMPTY}
    Element Should Be Visible   ${EMPTY CONFIRM PASSWORD MSG}
    Element Should Be Visible     ${FAILED TOAST MSG}  


CREATE_ACCOUNT_07: User create account with all empty fields should failed
    Fill data to form and click button "Create Account"    ${EMPTY}    ${EMPTY}   ${EMPTY}   ${EMPTY}    ${EMPTY}
    Element Should Be Visible   ${EMPTY USERNAME MSG}
    Element Should Be Visible   ${EMPTY FIRSTNAME MSG}
    Element Should Be Visible   ${EMPTY LASTNAME MSG}
    Element Should Be Visible   ${EMPTY PASSWORD MSG}
    Element Should Be Visible   ${EMPTY CONFIRM PASSWORD MSG}
    Element Should Be Visible     ${FAILED TOAST MSG} 

CREATE_ACCOUNT_08: User create account with username length 19 characters should success (<20)
    Fill data to form and click button "Create Account"    aaaaaaaaaaaaaaaaaaa    nc   mk   12345678    12345678
    Element Should Be Visible   ${SUCCESS TOAST MSG} 

CREATE_ACCOUNT_09: User create account with username length 20 characters should success (=20)
    Fill data to form and click button "Create Account"    bbbbbbbbbbbbbbbbbbbb    nc   mk   12345678    12345678
    Element Should Be Visible   ${SUCCESS TOAST MSG} 

CREATE_ACCOUNT_10: User create account with username length 21 characters should failed (>20)
    Fill data to form and click button "Create Account"    ccccccccccccccccccccc    nc   mk   12345678    12345678
    Element Should Be Visible   ${USERNAME WARNING}
    Element Should Be Visible    ${FAILED TOAST MSG}


CREATE_ACCOUNT_11: User create account with password length 7 characters should failed (<8)
    Fill data to form and click button "Create Account"    ppim    nc   mk   1234567    1234567
    Element Should Be Visible   ${PASSWORD WARNING}
    Element Should Be Visible    ${FAILED TOAST MSG}

CREATE_ACCOUNT_12: User create account with password length 8 characters should success (=8)
    Fill data to form and click button "Create Account"    ppim1    nc   mk   12345678    12345678
    Element Should Be Visible   ${SUCCESS TOAST MSG}

CREATE_ACCOUNT_13: User create account with password length 9 characters should success (>8)
    Fill data to form and click button "Create Account"    ppim2    nc   mk   123456789    123456789
    Element Should Be Visible   ${SUCCESS TOAST MSG}

CREATE_ACCOUNT_14: User create account with mismatched password and confirm password should failed
    Fill data to form and click button "Create Account"    ppim3    nc   mk   12345678    12345678910
    Element Should Be Visible   ${PASSWORD MISMATCHED MSG}
    Element Should Be Visible    ${FAILED TOAST MSG}


*** Keywords ***
Fill data to form and click button "Create Account"
    [Arguments]    ${USERNAME}   ${FIRST NAME}   ${LAST NAME}    ${PASSWORD}    ${CONFIRM PASSWORD}
    Input Text    ${INPUT USERNAME}    ${USERNAME}
    Input Text    ${INPUT FIRSTNAME}    ${FIRST NAME}
    Input Text    ${INPUT LASTNAME}    ${LAST NAME}
    Input Password    ${INPUT PASSWORD}    ${PASSWORD}
    Input Password    ${INPUT CONFIRM PASSWORD}    ${CONFIRM PASSWORD}
    Press Keys    ${CREATE ACCOUNT BTN}   Return 


    


