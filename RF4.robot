*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']
${contract_type_widget_display}    //*[@class='contract-type-widget__display']
${contract_high_low_item}    //*[@id='dt_contract_high_low_item']

*** Keywords ***

Verify Loading
    Wait Until Page Does Not Contain Element    //*[contains(@aria-label,"Loading")]    30
	Wait Until Page Does Not Contain Element    //*[contains(@class,'chart-container__loader')]    30

*** Test Cases ***
Task 4
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    Derrick123
    Input Text    //input[@type='password']    Derrick123
    Click Element    //button[@type='submit']
    Verify Loading
    Click Element    dt_core_account-info_acc-info
    Wait Until Page Contains Element    //div[@class='acc-switcher__loginid-text' and contains(.,'CR4457136')]    30
    Click Element   dt_core_account-switcher_demo-tab
    Wait Until Page Contains Element    //div[@class='acc-switcher__loginid-text' and contains(.,'VRTC6739285')]    30
    Click Element    //span[@class="acc-switcher__id"]
    Wait Until Page Contains Element    //div[@class='btn-purchase__info btn-purchase__info--right']    30
    Click Element   //div[@class='cq-symbol-select-btn__container']
    Wait Until Page Contains Element    //*[@class="ciq-menu ciq-enabled cq-chart-title stx-show cq-symbols-display stxMenuActive"]
    Sleep    15
    Click Element    //*[contains(text(),'Forex')]
    Wait Until Page Contains Element    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ' and contains(.,'AUD/USD')]    50
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ' and contains(.,'AUD/USD')]
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    20
    Click Element    ${contract_type_widget_display}
    Click Element    ${contract_high_low_item}
    Click Element    //*[@class='dc-input__field']
    Press Keys    none    BACKSPACE+1
    Press Keys    //div[@class='dc-input-field trade-container__barriers-single']    CTRL+A+BACKSPACE
    Input Text    dt_barrier_1_input    -0.11111
    Sleep    2
    Element Should Be Disabled    //button[@id='dt_purchase_put_button']
    [Teardown]    Close Browser