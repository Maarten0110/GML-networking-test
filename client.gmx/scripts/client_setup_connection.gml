/// setup_connection()
// Configures the network settings in the right way.

network_set_config(network_config_connect_timeout, TIME_OUT);
network_set_config(network_config_use_non_blocking_socket, 1);
