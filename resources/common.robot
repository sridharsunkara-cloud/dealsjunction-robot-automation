
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}        https://www.dealsjunction.de/
${BROWSER}    chrome

*** Keywords ***
Open DealsJunction
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
