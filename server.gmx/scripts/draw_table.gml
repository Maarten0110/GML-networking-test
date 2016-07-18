/// draw_table()
// Draws the table to the screen.

if (surface_exists(surface)) {

    // Draw on a surface to make sure that text that is scrolled
    // outside the table is not visible when drawing to the
    // screen.
    surface_set_target(surface);

    draw_set_font(fnt_console);
    var yy = title_height + 3;
    
    // draw table background
    draw_set_color(TABLE_CONTENTS_BG_COLOR);
    draw_rectangle(0, 0, width, height, false);
    
    // draw rows
    draw_set_color(c_black);
    var yyy = yy*2 + 1;
    for (var i = 0; i < ds_list_size(rows); i++) {
        yyy += draw_table_row(rows[| i], scroll_distance+yyy) + 2;
    };
    
    // draw outlines, title and header background
    draw_set_color(c_white);
    draw_rectangle(0, 0, width - 2, yy, false);
    
    draw_set_color(TABLE_COLUMN_HEADER_BG_COLOR);
    draw_rectangle(1, yy, width-2, yy * 2, false);
    
    draw_set_color(THEME_COLOR);
    draw_rectangle(0, 0, width - 1, y + height - 1, true);
    draw_rectangle(0, 0, width, yy, true);

    draw_set_color(c_black);
    draw_text(x + 2, y + 3, title);
    
    // draw column headers
    var xx = 0;
    for (var i = 0; i < ds_list_size(columns); i++) {
        var column = columns[| i];
        draw_set_color(c_black);
        draw_text(xx + 2, yy + 3, column[? "name"]);
        draw_set_color(THEME_COLOR);
        draw_rectangle(xx, yy, xx + column[? "size"],
                        yy * 2, true);
        xx += column[? "size"];
    };
    
    surface_reset_target();
    // Draw the correct part of the surface on the screen.
    draw_surface_part(surface, 0, 0, width, height, x, y);
} else {
    // Surface was destroyed in the volatile world of texture
    // memory, so it needs to be recreated.
    surface = surface_create_power2(width, height);
}
