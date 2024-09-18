** Settings **
Library    SeleniumLibrary

** Variables **
${URL}            http://www.google.com
${name_input}     9arm
** Test Cases **
Search Kasidit Wansut
    [Documentation]    ค้นหาคำว่า 9arm บน Google และคลิกผลลัพธ์ที่มีลิงก์ไปยัง YouTube
    Open Browser    ${URL}    chrome
    Input Text    name=q    ${name_input}
    Press Keys    name=q    ENTER
    Wait Until Page Contains    ${name_input}    10s
Click Kasidit Wansut
    [Documentation]    open YouTube
    ${link_element}    Get WebElement    xpath=//div[@class='yuRUbf']//a[contains(@href, 'youtube')]
    ${link_title}    Get Element Attribute    ${link_element}    title
    Log    ${link_title}
    Click Element    ${link_element}
    Wait Until Page Contains    YouTube    10s
    ${page_title}    Get Title
    Should Contain    ${page_title}    ${name_input}
    Sleep    4s
    Close Browser