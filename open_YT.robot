** Settings ** #import library
Library    SeleniumLibrary 

** Variables ** #สร้างตัวแปร
${URL}            http://www.google.com 
${name_input}     กษิดิศ วันสุดล

** Test Cases **
Search Kasidit Wansut #search ใน google ว่า กษิดิศ วันสุดล
    [Documentation]    ค้นหาคำว่า กษิดิศ วันสุดล บน Google และคลิกผลลัพธ์ที่มีลิงก์ไปยัง YouTube #doc ที่บอกว่า test case นี้ทำอะไรบ้าง
    Open Browser    ${URL}    chrome #เปิด browser ตามตัวแปร url
    Input Text    name=q    ${name_input} #input text ตามตัวแปร name_input
    Press Keys    name=q    ENTER #กด enter
    Wait Until Page Contains    ${name_input}    10s #เช็คว่า page ที่หามีคำว่า กษิดิศ วันสุดล ไหม โดยรอภายใน 10 วิ 
Click Kasidit Wansut #click youtube on google search result
    [Documentation]    open YouTube #doc ที่บอกว่า test case นี้ทำอะไรบ้าง
    ${link_element}    Get WebElement    xpath=//div[@class='yuRUbf']//a[contains(@href, 'youtube')] #คลิกเว็ปที่มี yuRUbf ในลิ้ง url และเป็นเว็ป youtube
    ${link_title}    Get Element Attribute    ${link_element}    title #เก็บ text title จาก tab google search
    Log    ${link_title} #ใส่ text title ใน log
    Click Element    ${link_element} #click link youtube
    Wait Until Page Contains    YouTube    10s #เช็คว่า page มีคำว่า Youtube ไหม โดยรอภายใน 10 วิ
    ${page_title}    Get Title #เก็บ text title จาก tab youtube
    Should Contain    ${page_title}    ${name_input} #check title ว่ามีคำว่า กษิดิศ วันสุดล ไหม
    Sleep    4s #รอ 4 วิ
    Close Browser # ปิด browser
    #run file ผ่าน cmd ด้วยคำสั่ง python -m robot ชื่อไฟล์