/// console_update()
// Updates the text shown in the console and checks for
// scrolling.

// Update the text shown in the console.
if (ds_list_size(console_messages) > console_messages_size) {
    if (console_messages_size > 0)
        console_text = console_text + "#";
    console_text = console_text + ds_list_find_value(
                                    console_messages,
                                    console_messages_size);
    console_messages_size++;
}

// Check for scrolling.
if (mouse_x > console_x &&
    mouse_x <= console_x + console_width &&
    mouse_y > console_y + console_title_height &&
    mouse_y <= console_y + console_height) {
    
    if (mouse_wheel_up()) console_scroll(CONSOLE_UP);
    if (mouse_wheel_down()) console_scroll(CONSOLE_DOWN);
}
