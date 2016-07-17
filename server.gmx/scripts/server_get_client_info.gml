/// server_get_client_info(client_data, key)
var client_data = argument0;
var key = argument1;

if (ds_map_exists(client_data, key)) {
    return ds_map_find_value(client_data, key);
} else {
    show_error("Client info (" + key
                + ") does not exist.", true);
}
