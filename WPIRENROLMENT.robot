*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${wpurl}    https://www.qnet.net/
${wpir}    HZ105891
${wppass}   testpw

*** Test Cases ***
IR Purchase
    Given User already in the wp public page
    And Maximize The Browser Window
    And Click login link
    And Switch to new window
    Input Text    id=ctl00_ContentPlaceHolder1_txtTCO   ${wpir}
    Input Text    id=ctl00_ContentPlaceHolder1_txtPassword   ${wppass}
    Click Element   id=ctl00_ContentPlaceHolder1_btnLogin
    Sleep    5
    Capture Page Screenshot
    Close Browser

IR Enrolment
    Open Browser    ${wpurl}  edge
    And Maximize The Browser Window
    Click Element    //*/a[contains(@href, '/en/login')]
    Switch Window  locator=NEW
    Input Text    id=ctl00_ContentPlaceHolder1_txtTCO   ${wpir}
    Input Text    id=ctl00_ContentPlaceHolder1_txtPassword   ${wppass}
    Click Element   id=ctl00_ContentPlaceHolder1_btnLogin
    Sleep    5
    Capture Page Screenshot
    Close Browser


*** Keywords ***
User already in the wp public page
    Open Browser    ${wpurl}  edge

Maximize The Browser Window
    Maximize Browser Window

Click login link
    Click Element    //*/a[contains(@href, '/en/login')]

Switch to new window
    Switch Window  locator=NEW