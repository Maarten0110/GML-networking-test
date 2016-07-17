/// client_table_update()

table_clear(client_table);

var current_key = ds_map_find_first(server_clients);
for (var i = 0; i < ds_map_size(server_clients); i++) {

    var client_data = ds_map_find_value(server_clients,
                                        current_key);
    var row = table_row_create(client_table);
    table_row_add_entry(client_table, row, "socket",
                        string(client_data[? "socket"]));
    table_row_add_entry(client_table, row, "ip",
                        string(client_data[? "ip"]));
    table_row_add_entry(client_table, row, "name",
                        string(client_data[? "name"]));
    table_row_add_entry(client_table, row, "disconnected",
                        "no");
    current_key = ds_map_find_next(server_clients,
                                    current_key);
};
current_key = ds_map_find_first(server_disconnected_clients);
for (var i = 0;
        i < ds_map_size(server_disconnected_clients); i++) {

    var client_data = ds_map_find_value(
                        server_disconnected_clients,
                        current_key);
    var row = table_row_create(client_table);
    
    table_row_add_entry(client_table, row, "socket",
                        string(client_data[? "socket"]));
    table_row_add_entry(client_table, row, "ip",
                        string(client_data[? "ip"]));
    table_row_add_entry(client_table, row, "name",
                        string(client_data[? "name"]));
    table_row_add_entry(client_table, row, "disconnected",
                        "yes");
                        
    current_key = ds_map_find_next(
                server_disconnected_clients, current_key);
};

