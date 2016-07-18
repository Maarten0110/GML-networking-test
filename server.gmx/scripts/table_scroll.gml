/// table_scroll(UP/DOWN)

if (argument0 == CONSOLE_DOWN)
    scroll_distance -= line_height;
if (argument0 == CONSOLE_UP)
    scroll_distance = min(0, scroll_distance + line_height);
