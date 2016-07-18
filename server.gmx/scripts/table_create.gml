/// table_create(int x, int y, int width, int height, string title)
var table = instance_create(argument0, argument1, obj_table);
table.width = argument2;
table.height = argument3;
table.title = argument4;
table.line_height = 13;
table.title_height = 15;
table.column_height = 0;
table.rows = ds_list_create();
table.columns = ds_list_create();
table.columns_total_size = 0;
table.surface = surface_create_power2(table.width, table.height);
table.scroll_distance = 0;
return table;
