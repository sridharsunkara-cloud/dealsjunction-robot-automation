*** settings ***
Library  SeleniumLibrary
Resource    ../resources/common.robot
Test Setup  Open DealsJunction
Test Teardown  Close All Browsers

*** Variables ***
${EXPECTED_TITLE}  DealsJunction — Your Local Indian Deals

*** Test Cases ***
Verify DealsJunction Homepage Title
    Title Should be  ${EXPECTED_TITLE}

Verify Restaurants Navigation
    Wait Until Element Is Visible   css=a[href="/restaurants"]    10s

    Click Element    css=a[href="/restaurants"]
    Wait Until Location Contains    /restaurants    10s
    Wait Until Element Is Visible   xpath=//h1[contains(., 'Indian Restaurants')]   10s
    Element Should Contain  xpath=//h1  Near You








