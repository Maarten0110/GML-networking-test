/// table_create_row(table)
// Creates a new row and immediately adds it to
// the given table.

var table = argument0;

var row = ds_map_create();
ds_list_add(table.rows, row);

return row;
