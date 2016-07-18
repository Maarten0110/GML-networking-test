/// table_create(int x, int y, int width, int height, string title)
// Sets up a variables, datastructures and a surface for the
// creation and visualization of a table.
var table = instance_create(argument0, argument1, obj_table);
table.width = argument2;
table.height = argument3;
table.title = argument4;
table.line_height = 13;
table.title_height = 15;
table.column_height = 0;

// List containing ds_maps which represent the row contents
// (the keys of these maps are the column names):
table.rows = ds_list_create();

// List containing ds_maps which represent the column headers
// (The only two keys in these maps are "name" and "size")
table.columns = ds_list_create();

table.columns_total_size = 0; // For keeping an eye on the
                              // width of all columns
                              // combined.
table.surface = surface_create_power2(table.width, table.height);
table.scroll_distance = 0;

return table;
