*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']
${core_account_info}    //*[@id="dt_core_account-info_acc-info"]
${demo_acc_button}    //*[@id="dt_core_account-switcher_demo-tab"]
${demo_vrtc_button}   //*[@id="dt_VRTC6202199"]
*** Test Cases ***
Login To Deriv
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Set Selenium Speed    1
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    derrick@besquare.com.my
    Input Text    //input[@type='password']    Derrick123
    Click Element    //button[@type='submit']
Verify Real Account
    Wait Until Page Contains Element    //*[@id="dt_core_account-info_acc-info"]    10
    Click Element    ${core_account_info}
    Wait Until Page Contains Element    //*[@id="dt_core_account-info_acc-info"]    10
    Page Should Contain    Add or manage account
Change to Demo Account
    Click Element    ${demo_acc_button}
    Wait Until Page Contains Element    //div[@id='dt_VRTC6202199']    10
    Click Element    ${demo_vrtc_button}    
    Wait Until Page Contains Element    //div[@id='dt_core_account-info_acc-info']    20

    

    

    

