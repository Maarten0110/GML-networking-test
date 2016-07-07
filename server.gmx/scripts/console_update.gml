/// console_update()

if (ds_list_size(console_messages) > console_messages_size) {
    if (console_messages_size > 0)
        console_text = console_text + "#";
    console_text = console_text + ds_list_find_value(
                                    console_messages,
                                    console_messages_size);
    console_messages_size++;
}

if (mouse_x > 0 && mouse_x <= console_width &&
    mouse_y > console_title_height && mouse_y <= room_height) {
    
    if (mouse_wheel_up()) console_scroll(CONSOLE_UP);
    if (mouse_wheel_down()) console_scroll(CONSOLE_DOWN);
}
