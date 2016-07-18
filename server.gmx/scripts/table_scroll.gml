/// table_scroll(UP/DOWN)
// Scrolls the content oof the table up or down.
if (argument0 == CONSOLE_DOWN)
    scroll_distance -= line_height;
// Can't scroll past the beginning of the table.
if (argument0 == CONSOLE_UP)
    scroll_distance = min(0, scroll_distance
                            + line_height);
