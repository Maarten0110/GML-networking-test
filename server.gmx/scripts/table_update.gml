/// table_update()

if (mouse_x >  x &&
    mouse_x <= x + width &&
    mouse_y >  y + (title_height + 3)*2 &&
    mouse_y <= y + height) {
    
    if (mouse_wheel_up()) table_scroll(CONSOLE_UP);
    if (mouse_wheel_down()) table_scroll(CONSOLE_DOWN);
}
