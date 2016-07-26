/// network_settings_setup
enum network_settings {
    PORT = 6510,
    MAX_ATTEMPTS = 5,
    TIMEOUT = 4000,
    MESSAGE_BUFFER_SIZE = 1000
};
enum requests {
    PUT_NAME
};
enum packet_collector_states {
    WAITING,
    READING
};
network_set_config(network_config_connect_timeout, network_settings.TIMEOUT);
