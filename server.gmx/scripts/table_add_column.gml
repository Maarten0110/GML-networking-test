/// table_add_column(table, string column_name, int size)

var table = argument0;
var column_name = argument1;
var size = argument2;

if (table.columns_total_size + size > table.width) {
    show_error("Can't add column: this would exceed the"
                + " maximum with of the table ("
                + table.title + ".", false);
    exit;
}

var column = ds_map_create();
column[? "name"] = column_name;
column[? "size"] = size;

ds_list_add(table.columns, column);
