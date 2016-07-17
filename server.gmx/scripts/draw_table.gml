/// draw_table()

if (surface_exists(surface)) {
    
    surface_set_target(surface);

    draw_set_font(fnt_console);
    var title_height = string_height(title);
    var yy = title_height + 3;
    
    // draw table background
    draw_set_color(TABLE_CONTENTS_BG_COLOR);
    draw_rectangle(0, 0, width, height, false);
    
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
    
    // draw rows
    var row_height = 0;
    var yy = yy*2 + 1;
    for (var i = 0; i < ds_list_size(rows); i++) {
        yy += draw_table_row(rows[| i], yy) + 2;
    };

    surface_reset_target();
    draw_surface_part(surface, 0, 0, width, height, x, y);
} else {
    surface = surface_create_power2(width, height);
}
