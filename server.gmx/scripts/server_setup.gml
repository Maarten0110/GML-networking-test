/// server_setup()

network_set_config(network_config_connect_timeout, TIME_OUT);

server_socket = network_create_server(network_socket_tcp,
                                        PORT, MAX_CLIENTS);

// create a buffer to use for responses
server_buffer = buffer_create(8, buffer_grow, 1);

// Create a map to store client data:
//      key = socket id of the client socket
//      value = is a map with client data (see
//              server_create_client_data())
server_clients = ds_map_create();

// Create a map to store disconnected client data
//      key = ip adress of the client      
//      value = is a map with client data (same
//              as in server_clients)
server_disconnected_clients = ds_map_create();
