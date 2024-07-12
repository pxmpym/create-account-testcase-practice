
***Setting***
Library    SeleniumLibrary
Test Setup    Open Browser    ${URL}        chrome
Test Template    เมื่อสร้างบัญชีสำเร็จ จะแสดง toast message "สร้างบัญชีสำเร็จ"
Test Teardown    Close Browser

*** Variables ***
${URL}    D:\MyPractice\\simple-testcase\\create-account.html
${VALID_USERNAME}    tangmo1
${FIRST_NAME}    tangmo
${LAST_NAME}    tomang
${VALID_PASSWORD}    1234567abc
${VALID_CONFIRM_PASSWORD}    1234567abc

${USERNAME<20}    aaaaaaaaaaaaaaaaaaa
${USERNAME=20}    bbbbbbbbbbbbbbbbbbbb    

${PASSWORD=8}    12345678
${PASSWORD>8}    123456789

${TOAST_MESSAGE}    //*[@id="toast"]/div[contains(text(), 'สร้างบัญชีสำเร็จ')]



*** Test Cases ***                                      USERNAME    FIRSTNAME    LASTNAME    PASSWORD    CONFIRM_PASSWORD    TOAST_MESSAGE
ผู้ใช้สามารถสร้างบัญชีได้สำเร็จ เมื่อกรอกข้อมูลที่ถูกต้องและครบถ้วน    ${VALID_USERNAME}    ${FIRST_NAME}    ${LAST_NAME}    ${VALID_PASSWORD}    ${VALID_CONFIRM_PASSWORD}    ${TOAST_MESSAGE}
ผู้ใช้สามารถสร้างบัญชีได้ เมื่อกรอก Username ที่มีความยาวตัวอักษรน้อยกว่า 20 ตัว (19 ตัว)    ${USERNAME<20}    ${FIRST_NAME}    ${LAST_NAME}    ${VALID_PASSWORD}    ${VALID_CONFIRM_PASSWORD}    ${TOAST_MESSAGE}
ผู้ใช้สามารถสร้างบัญชีได้ เมื่อกรอก Username ที่มีความยาวตัวอักษรเท่ากับ 20 ตัว    ${USERNAME=20}    ${FIRST_NAME}    ${LAST_NAME}    ${VALID_PASSWORD}    ${VALID_CONFIRM_PASSWORD}    ${TOAST_MESSAGE}
ผู้ใช้สามารถสร้างบัญชีได้ เมื่อกรอก Password ที่มีความยาวตัวอักษรเท่ากับ 8 ตัว    ${VALID_USERNAME}    ${FIRST_NAME}    ${LAST_NAME}    ${PASSWORD=8}    ${PASSWORD=8}    ${TOAST_MESSAGE}
ผู้ใช้สามารถสร้างบัญชีได้ เมื่อกรอก Password ที่มีความยาวตัวอักษรมากกว่า 8 ตัว (9 ตัว)    ${VALID_USERNAME}    ${FIRST_NAME}    ${LAST_NAME}    ${PASSWORD>8}    ${PASSWORD>8}    ${TOAST_MESSAGE}  



*** Keywords ***
เมื่อสร้างบัญชีสำเร็จ จะแสดง toast message "สร้างบัญชีสำเร็จ"
    [Arguments]    ${USERNAME}    ${FIRST_NAME}    ${LAST_NAME}    ${PASSWORD}    ${CONFIRM_PASSWORD}    ${TOAST_MESSAGE}   
    Input Text    id=username    ${USERNAME} 
    Input Text    id=firstname    ${FIRST_NAME}
    Input Text    id=lastname    ${LAST_NAME}
    Input Password    id=password    ${PASSWORD}
    Input Password    id=confirmPassword    ${CONFIRM_PASSWORD}
    Press Keys    //*[@id="create-account-form"]/input   Return 
    Wait Until Element Is Visible    ${TOAST_MESSAGE}   
   
# Login ผิดพลาด จะต้องแสดงข้อความ Error
#     [Arguments]    ${USER}   ${PASSWORD}   ${ERROR_MESSAGE}
#     Input Username    ${USER}
#     Input Password    ${PASSWORD}
#     Submit Credentials
#     Error Message Should Be Show   ${ERROR_MESSAGE}