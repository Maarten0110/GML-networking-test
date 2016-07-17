/// table_create_row(table)
var table = argument0;

var row = ds_map_create();
ds_list_add(table.rows, row);

return row;
