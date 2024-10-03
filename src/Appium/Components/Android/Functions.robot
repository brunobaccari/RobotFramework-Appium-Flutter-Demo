*** Settings ***
Library     AppiumLibrary


*** Variables ***
${position}     ${EMPTY}
${x_axis}       ${EMPTY}
${y_axis}       ${EMPTY}
${carousel}     ${EMPTY}


*** Keywords ***
And swipe to the direction/anchor
    [Arguments]    ${direction}    ${anchor}
    ${status}=    Run Keyword And Return Status    Wait Until Page Contains    ${carousel}    5s
    IF    '${status}' == 'False'
        And scroll to direction/anchor    ${direction}    ${anchor}
    END

And scroll to direction/anchor
    [Arguments]    ${direction}    ${anchor}
    ${element_size}=    Get Element Size    ${anchor}
    ${positions}=    Get Element Location    ${anchor}
    ${start_x}=    Evaluate    ${positions}[x] + ${element_size}[width] / 2
    ${start_y}=    Evaluate    ${positions}[y] + ${element_size}[height] / 2

    IF    '${direction}' == 'left'
        ${offset_x}=    Evaluate    ${start_x} - 500
        ${offset_y}=    Set Variable    ${start_y}
    ELSE IF    '${direction}' == 'right'
        ${offset_x}=    Evaluate    ${start_x} + 500
        ${offset_y}=    Set Variable    ${start_y}
    ELSE IF    '${direction}' == 'up'
        ${offset_x}=    Set Variable    ${start_x}
        ${offset_y}=    Evaluate    ${start_y} - 500
    ELSE IF    '${direction}' == 'down'
        ${offset_x}=    Set Variable    ${start_x}
        ${offset_y}=    Evaluate    ${start_y} + 500
    END

    Swipe    start_x=${start_x}    start_y=${start_y}    offset_x=${offset_x}    offset_y=${offset_y}    duration=1000

And scroll in direction
    [Arguments]    ${direction}
    ${screen_size}=    Get Element Size    xpath=/hierarchy/android.widget.FrameLayout
    ${start_x}=    Evaluate    ${screen_size['width']} / 2
    ${start_y}=    Evaluate    ${screen_size['height']} / 2

    IF    '${direction}' == 'left'
        ${offset_x}=    Evaluate    ${start_x} - 500
        ${offset_y}=    Set Variable    ${start_y}
    ELSE IF    '${direction}' == 'right'
        ${offset_x}=    Evaluate    ${start_x} + 500
        ${offset_y}=    Set Variable    ${start_y}
    ELSE IF    '${direction}' == 'up'
        ${offset_x}=    Set Variable    ${start_x}
        ${offset_y}=    Evaluate    ${start_y} - 500
    ELSE IF    '${direction}' == 'down'
        ${offset_x}=    Set Variable    ${start_x}
        ${offset_y}=    Evaluate    ${start_y} + 500
    END

    Swipe    ${start_x}    ${start_y}    ${offset_x}    ${offset_y}    1000
