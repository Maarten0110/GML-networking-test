/// table_row_add_entry(table, row, string column_name, string entry)
// Adds an entry to a row.

var table = argument0;
var row = argument1;
var column_name = argument2;
var entry = argument3;

// Check if the entry is valid (column header exists)
var is_valid_column = false;
for (i = 0; i < ds_list_size(table.columns) ; i++) {
    var column = table.columns[| i];
    if (column[? "name"] == column_name) {
        is_valid_column = true;
        break;
    }
};

// If so, add entry, otherwise show error.
if (is_valid_column)
    row[? column_name] = entry;
else
    show_error("Can't enter row entry to "
                + "non-existing column." , false);
