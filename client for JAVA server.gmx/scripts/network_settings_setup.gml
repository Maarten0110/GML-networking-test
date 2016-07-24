/// network_settings_setup
enum network_settings {
    PORT = 6510,
    MAX_ATTEMPTS = 5,
    TIMEOUT = 4000
};
enum requests {
    PUT_NAME
}
network_set_config(network_config_connect_timeout, network_settings.TIMEOUT);
