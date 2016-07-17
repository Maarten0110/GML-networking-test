/// draw_console();

if (surface_exists(console_surface)) {
    surface_set_target(console_surface);
    draw_set_font(fnt_console);
    draw_set_color(c_black);
    draw_rectangle(0, console_title_height+1, console_width-1,
                    console_height, false);
    draw_set_color(c_white);

    draw_text_ext(1, console_text_y, console_text,
                    console_line_height, console_width);
                    
    if (image_index % room_speed*2 < room_speed)
        draw_text(3, console_text_y + string_height_ext(
                    console_text, console_line_height,
                    console_width), "_");
        
    draw_rectangle(0, 0, console_width,
                    console_title_height, false);
    draw_set_color(THEME_COLOR);
    draw_rectangle(0, 0, console_width, console_height, true);
    draw_rectangle(0, 0, console_width, console_title_height,
                    true);
    
    draw_set_color(c_black);
    draw_text(2, 3, "console");
    surface_reset_target();
    
    draw_surface_part(console_surface, 0, 0, console_width+1,
                        console_height+1, console_x, console_y);
} else {
    console_surface = surface_create_power2(console_width,
                                            console_height);
}
