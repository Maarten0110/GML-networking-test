/// server_handle_client_disconnection(socket)

// Check if client reported that it is about to
// log off. If so, delete client data from
// server_clients. If not, move client data from
// server_clients to server_disconnected_clients.

var socket = argument0;

var client_data = server_get_client_data(socket);

if (server_get_client_info(client_data,
                           "logging_off") == true) {

    // delete client data from server_clients
    ds_map_delete(server_clients, socket);
    // destroy used data structure
    ds_map_destroy(client_data);
    
    console_print("A client (" + string(socket)
                    + ") logged off.");
    
} else {
    
    var ip = server_get_client_info(client_data,
                                        "ip");
    // move client data from server_clients to
    // server_disconnected_clients.
    ds_map_add(server_disconnected_clients, ip,
               client_data);
    ds_map_delete(server_clients, socket);
    
    console_print("A client (" + string(socket)
                    + ") disconnected.");
    
}
