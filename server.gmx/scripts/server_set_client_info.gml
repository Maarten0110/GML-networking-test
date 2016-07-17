/// server_set_client_info(client_data, key, value)
var client_data = argument0;
var key = argument1;
var value = argument2;

if (ds_map_exists(client_data, key)) {
    ds_map_replace(client_data, key, value);
} else {
    show_error("Client info (" + key
                + ") does not exist.", true);
}
