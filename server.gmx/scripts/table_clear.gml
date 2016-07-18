/// table_clear(table)
// Destroys all contents of the table.

var table = argument0;

for (var i = 0; i < ds_list_size(table.rows); i++)
    ds_map_destroy(table.rows[| i]);
ds_list_clear(table.rows);
