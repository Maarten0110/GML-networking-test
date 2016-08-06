/// network_settings_setup
enum network_settings {
    PORT = 6510,
    MAX_ATTEMPTS = 5,
    TIMEOUT = 4000,
    PACKET_COLLECTOR_BUFFER_SIZE = 1024,
};
enum header {
    MAGIC_NUMBER = 1313131313,
    MAGIC_NUMBER_TYPE = buffer_s32,
    MAGIC_NUMBER_SIZE = 4,
    SIZE_INDICATOR_TYPE = buffer_s16,
    SIZE_INDICATOR_SIZE = 2,
    SIZE_INDICATOR_MAX_VALUE = 32767,
    REQUEST_TYPE = buffer_s16,
    REQUEST_SIZE = 2
};
enum requests {
    DEBUG,
    PUT_NAME
};
enum packet_collector_states {
    WAITING,
    READING
};
network_set_config(network_config_connect_timeout, network_settings.TIMEOUT);
