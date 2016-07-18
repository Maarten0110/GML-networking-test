/// draw_table_row(row, int y)
// Draws yhe given table row and returns the height
// of the row.
var row = argument0;
var yy = argument1;
var xx = 3;

draw_set_font(fnt_console);
var row_height = 0;
for (var i = 0; i < ds_list_size(columns); i++) {
    var column = columns[| i];
    var text = row[? column[? "name"]];
    var size = column[? "size"];
    draw_set_color(c_black);
    draw_text_ext(xx, yy, text, line_height, size);
    var text_height = string_height_ext(text,
                            line_height, size);
    xx += size;
    row_height = max(row_height, text_height);
}

return row_height;
