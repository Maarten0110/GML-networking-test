/// console_scroll(UP/DOWN)

if (argument0 == CONSOLE_UP)
    console_text_y -= console_line_height;
if (argument0 == CONSOLE_DOWN)
    if (console_text_y != console_text_y_start)
        console_text_y += console_line_height;
