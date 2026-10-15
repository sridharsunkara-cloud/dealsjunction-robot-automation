
*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Test Cases ***
Verify DealsJunction Website HTTP Status
    ${response}=    GET    https://www.dealsjunction.de/
    Status Should Be    200    ${response}
    Log To Console    HTTP Status: ${response.status_code}



Verify Restaurant Search API Data
    ${response}=    GET    url=https://www.dealsjunction.de/api/search    params=q=restaurant
    Status Should Be    200    ${response}

    ${data}=    Evaluate    $response.json()
    Should Be True    isinstance($data, list)

    FOR    ${item}    IN    @{data}
        Dictionary Should Contain Key    ${item}    id
        Dictionary Should Contain Key    ${item}    title
        Dictionary Should Contain Key    ${item}    category
        Dictionary Should Contain Key    ${item}    status
        Should Be Equal    ${item}[status]    approved
        Should Be Equal    ${item}[is_deleted]    ${False}
    END


Verify Search With No Matching Results
    ${response}=    GET    url=https://www.dealsjunction.de/api/search    params=q=zzzxxyy987654321
    Status Should Be    200    ${response}

    ${data}=    Evaluate    $response.json()
    Should Be True    isinstance($data, list)
    Length Should Be    ${data}    0


