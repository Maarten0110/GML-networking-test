/// table_add_column(table, string column_name, int size)
// Adds a new column header to the table.
var table = argument0;
var column_name = argument1;
var size = argument2;

// Check if the width of all columns combined does not
// exceed the width of the table after the given column
// would be added to the given table.
if (table.columns_total_size + size > table.width) {
    show_error("Can't add column: this would exceed the"
                + " maximum with of the table ("
                + table.title + ".", false);
    exit;
}
table.columns_total_size += size;

// Add new column header to the columns list.
var column = ds_map_create();
column[? "name"] = column_name;
column[? "size"] = size;

ds_list_add(table.columns, column);
