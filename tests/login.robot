
*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common.robot
Test Setup    Open DealsJunction
Test Teardown    Close All Browsers

*** Test Cases ***
Verify Login Page Opens
    Go To    ${URL}login
    Wait Until Location Contains    /login    10s

Verify Email Input Field
    Go To    ${URL}login
    Wait Until Element Is Visible    css=input[type="email"]    10s
    Clear Element Text    css=input[type="email"]
    Input Text    css=input[type="email"]    robot.test@example.com
    Textfield Value Should Be    css=input[type="email"]    robot.test@example.com

Verify Password Input Field
    Go To    ${URL}login
    Wait Until Element Is Visible    css=input[type="password"]    10s
    Clear Element Text    css=input[type="password"]
    Input Password    css=input[type="password"]    RobotTest123!
    Textfield Value Should Be    css=input[type="password"]    RobotTest123!

Verify Login Required Fields
    Go To    ${URL}login
    Wait Until Element Is Visible    css=input[type="email"]    10s
    Clear Element Text    css=input[type="email"]
    Clear Element Text    css=input[type="password"]
    Click Button    css=button[type="submit"]
    ${email_valid}=    Execute Javascript    return document.querySelector('input[type="email"]').checkValidity()
    Should Not Be True    ${email_valid}
