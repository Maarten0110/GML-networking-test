/// console_scroll(UP/DOWN)
// Scrolls the console text up or down.

if (argument0 == CONSOLE_DOWN)
    console_text_y -= console_line_height;
// Can't scroll past the beginning of the text:
if (argument0 == CONSOLE_UP)
    if (console_text_y != console_text_y_start)
        console_text_y += console_line_height;
