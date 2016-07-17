/// console_scroll(UP/DOWN)

if (argument0 == CONSOLE_DOWN)
    console_text_y -= console_line_height;
if (argument0 == CONSOLE_UP)
    if (console_text_y != console_text_y_start)
        console_text_y += console_line_height;
