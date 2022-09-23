*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']
${core_account_info}    //*[@id="dt_core_account-info_acc-info"]
${demo_acc_button}    //*[@id="dt_core_account-switcher_demo-tab"]
${demo_vrtc_button}   //*[@id="dt_VRTC6202199"]
${dropdown_volatility}    //div[@class="cq-symbol-select-btn"]
${dropdown_contr_risefall}    //*[@id="dt_contract_dropdown"]

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
    
Choose Volatility 10(1s) Index
    sleep    15s
    Click Element    ${dropdown_volatility}    
    Wait Until Page Contains    Volatility 10 (1s) Index    10
    Click Element    //*[@class='sc-mcd__item__name' and text()='Volatility 10 (1s) Index']  
    sleep    15s
    Wait Until Page Contains    Volatility 10 (1s) Index    10
    Click Element    ${dropdown_contr_risefall}
    Wait Until Page Contains Element    //*[@id="dt_contract_rise_fall_item"]    20
    Click Element    //*[@id="dt_contract_rise_fall_item"]
    Wait Until Page Contains Element    //*[@id="dt_contract_dropdown"]    10    
    Click Element    //*[@id="dc_t_toggle_item"]
    Wait Until Page Contains    //*[@id="dt_range_slider_label"]    20
    Click Element    //*[@data-testid="tick_step_2"]
    Wait Until Page Contains    2 Ticks    10
    Click Element    //*[@data-testid="tick_step_3"]
    Wait Until Page Contains Element    3 Ticks    20
    Click Element    //*[@data-testid="tick_step_4"]
    Wait Until Page Contains Element    4 Ticks    10
    Click Element    //*[@data-testid="tick_step_5"]
    Wait Until Page Contains Element    5 Ticks    20
    Click Element    //*[@id="dc_stake_toggle_item"]
    Wait Until Page Contains Element    //*[@id="dt_amount_toggle"]/div/span    10 


    





