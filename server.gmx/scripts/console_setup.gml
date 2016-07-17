/// console_setup()

console_x = 0;
console_y = room_height/2;
console_width = room_width-1;
console_height = room_height/2-1;
console_surface = surface_create_power2(
                    console_width, console_height);
console_messages = ds_list_create();
console_messages_size = 0;
console_text = "";
console_title_height = 15;
console_text_y = console_title_height+2;
console_text_y_start = console_text_y;
console_line_height = 13;
