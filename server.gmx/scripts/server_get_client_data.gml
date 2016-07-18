/// server_get_client_data(socket)
// Attempts to retrieve the client_data that belongs
// to the given socket ID.

var socket = argument0;
if (ds_map_exists(server_clients, socket)) {
    return ds_map_find_value(server_clients, socket);
} else {
    show_error("Client data (socket = " + string(socket)
                + ") does not exist.", true);
}
