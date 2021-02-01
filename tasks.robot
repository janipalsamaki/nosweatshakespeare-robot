*** Settings ***
Documentation     Log an act of Romeo & Juliet.
Library           Browser
Library           String

*** Variables ***
${ACT_TITLE}=     %{ACT_TITLE="Modern Romeo & Juliet Act 1, Prologue"}

*** Tasks ***
Log an act from nosweatshakespeare.com
    ${act_text}=    Get act by title    ${ACT_TITLE}
    Log To Console    ${act_text}

*** Keywords ***
Get act by title
    [Arguments]    ${title}
    New Page    https://www.nosweatshakespeare.com/romeo-juliet-play/
    Click    ${title}
    ${section_text}=    Get Text    section.av_textblock_section
    ${act_text}=    Fetch From Left    ${section_text}    ~
    [Return]    ${act_text}
