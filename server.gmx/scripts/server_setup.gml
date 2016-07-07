/// server_setup()

network_set_config(network_config_connect_timeout, TIME_OUT);
network_set_config(network_config_use_non_blocking_socket, 1);

server_socket = network_create_server(network_socket_tcp,
                                        PORT, MAX_CLIENTS);
server_clients = ds_list_create();
server_unidentified_clients = ds_list_create();
