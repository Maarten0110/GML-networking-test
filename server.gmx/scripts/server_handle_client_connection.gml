/// server_handle_client_connection(socket, ip);

// Check if this is the first time that the client connects.
// If so, add the client data of this client to the 
// server_clients map. If not, move the client data of this
// client from server_disconnected_clients to server_clients.

var socket = argument0;
var ip = argument1;

if (ds_map_exists(server_disconnected_clients, ip)) {

    // update the socket id of the client
    var client_data = ds_map_find_value(
                        server_disconnected_clients, ip);
    ds_map_replace(client_data, "socket", socket);
    
    // move the client_data from server_disconnected_clients
    // to server_clients
    ds_map_add(server_clients, socket, client_data);
    ds_map_delete(server_disconnected_clients, ip);
    
    var name = server_get_client_info(client_data, "name");
    console_print(name + " reconnected (id = " + string(socket)
                    + ").");
    
} else {
    
    // create client data and add it to server_clients
    var client_data = server_create_client_data(socket);
    server_set_client_info(client_data, "ip", ip);
    ds_map_add(server_clients, socket, client_data);
    
    console_print("A client made a connection. (id = "
                    + string(socket) + "; ip = " + ip + ")");
                    
}
