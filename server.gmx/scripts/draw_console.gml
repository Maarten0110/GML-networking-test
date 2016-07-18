/// draw_console();
// draws the console on the screen

if (surface_exists(console_surface)) {
    
    // Draw on a surface to make sure that text that is scrolled
    // outside the console is not visible when drawing to the
    // screen.
    surface_set_target(console_surface);
    draw_set_font(fnt_console);
    draw_set_color(c_black);
    // Draw the black background.
    draw_rectangle(0, console_title_height+1, console_width-1,
                    console_height, false);
    // Draw the console text/output.
    draw_set_color(c_white);
    draw_text_ext(1, console_text_y, console_text,
                    console_line_height, console_width);               
    if (image_index % room_speed*2 < room_speed)
        draw_text(3, console_text_y + string_height_ext(
                    console_text, console_line_height,
                    console_width), "_");
    // Draw console title bar.  
    draw_rectangle(0, 0, console_width,
                    console_title_height, false);
    // Draw edges.                 
    draw_set_color(THEME_COLOR);
    draw_rectangle(0, 0, console_width, console_height, true);
    draw_rectangle(0, 0, console_width, console_title_height,
                    true);
    // Draw console title,
    draw_set_color(c_black);
    draw_text(2, 3, "console");

    surface_reset_target();
    // Draw the correct part of the surface on the screen.
    draw_surface_part(console_surface, 0, 0, console_width+1,
                        console_height+1, console_x, console_y);
} else {
    // Surface was destroyed in the volatile world of texture
    // memory, so it needs to be recreated.
    console_surface = surface_create_power2(console_width,
                                            console_height);
}
