*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${login_button}    //button[@id='dt_login_button']
${checkbox_admin}    //input[@name='admin']/../span
${token_create_button}    //button[@id='submit']


*** Keywords ***
# Load Browser
#     Open Browser    https://app.deriv.com/account/api-token    chrome
# Verify Loading
#     Wait Until Page Does Not Contain Element    //*[contains(@aria-label,"Loading")]    30
# 	Wait Until Page Does Not Contain Element    //*[contains(@class,'chart-container__loader')]    30

*** Test Cases ***
Login To Deriv
    Open Browser     https://app.deriv.com/account/api-token/    chrome   
    Maximize Browser Window
    Set Selenium Speed    1
    # Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    # Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    derrick@besquare.com.my
    Input Text    //input[@type='password']    Derrick123
    Click Element    //button[@type='submit']

Leaving Input Field Token Name Empty
    Wait Until Page Contains Element    //*[@id="app_contents"]    30
    Element Should Contain    //*[@name='token_name']    ${EMPTY}
    Wait Until Page Contains Element    //*[@id="app_contents"]    20    


Clicking Checkbox

    # Click Element    //input[@type='checkbox' and @checked]
    Click Element    //*[@value='true']
    Wait Until Page Contains Element    //*[name()='path']    10	

Leaving Input Field Token Name Empty
    Click Element    ${token_create_button}

Input 50 For The Token Name
    Click Element    //button[@type='token_name'] 
    Input Text    //input[@type='token_name']    bcxfxv0m0jw1ygu5owykd5wjs7wr0kohqm75kdujridyyc6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaapclchp0bvrjtkfeesm4vt1ezd3rgtsrwg217csnlg1pic4xa9q3s21adsbl2o4rq6p4lzxajf4i7r7vnhkfackfvsvo1mg6nek4wsw981xy6igus9mo7oup3wl3vhpryifc5ali272x11rvlayrm9fjgr4ozwrjzaiihwtqfiuiz4sjjoo4srdqcp6bn3x2swer2572nrz35pdfjmaayvvnha4202xl09uhkgfeqn187nz3e0h2vymy5mfbq4zzobec5n48fmctjwy4ad9fqdy8c7d06kwxukv6j7ro2yyozt7s92qt2k1k2glg9vwvvmawepn7ux6mtxu1az1vpnom0et4xt52y2z39qmnhl21b44f76cherp352bdkwqomyd1xbp6demtem6oullb0ivapczircsd0sqfzobbpm1uie180rrsg44635j9dbw30xupleozl756jmf1kgtx3nqv89br7o2i5fg9j32l9odeizpa3dqofu8wl4gt159zqrdobjdotyrsb9t05g8gqnwug7iczpgblwncjq4v8hg12mjvk95dhwg15a645dez00x5z05ev714n3r4vu3i2khkjxjldugdr7r8u0a8vi3xg3nqi7ufj24it8p34av4q9gvx2kh33qemc1na0sgb7ksxn59cml2otrryxmn943m1lsercdy5yzrgm6lkqtjcl2y6ab7jhid7lre8asjrsfacxux53178dx6m9ui43l3dtj3r08d6vdz7lbs9i93o2zok1wikm23g2yue9u2lxnyteyput8qqwx0atgrjrrmoemr01ypbkulw7o4fg51flthin89pormdrb7zds06fmsmw0ubobaq4kvi1xwq911icbjgals5dkt0tqi3ow5ah9w8x7iarmtedgesjlrcv8j3i8siv1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaapvjs6kysg4bgfka94dnyo0s6yht
    Wait Until Page Contains Element    //div[@class='dc-field dc-field--error' and contains('Maximum 32 characters')]    20

Input Only 1 Character
    Input Text    //input[@text='token_name']    1
    Click Element    ${token_create_button}
    Wait Until Page Contains Element    //div[@class='dc-field' and contains('Length of token name must be between 2 and 32 characters.')]

Input Character Between 2 And 35
    Input Text    //input[@text='token_name']    abcJ_1KOlm
    Click Element    ${token_create_button}
    Wait Until Page Contains Element    //*[@class='dc-button' and text()='Create']

Copy Paste the Token ID
    Click Element    //*[@data-testid="dt_copy_token_icon"]
    Wait Until Page Contains Element    //*[@data-testid="dt_copy_token_icon" and text()='Token copied!']  
    
    



    



    
    



    
    
    
    
    

    
   
   
    