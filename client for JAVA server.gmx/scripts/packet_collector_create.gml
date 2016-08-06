/// packet_collector_create()
// Creates a packet_collector. The packet_collector will fire the user defined
// event number 0 whenever a complete message has been collected.

var map = ds_map_create();

map[? "state"] = packet_collector_states.WAITING;
map[? "buffer_size"] = 0;

// The server should write a size indicator after the magic number containing
// the size of the message without its header (aka the message body). This
// size indication is then stored in target_size:
map[? "target_size"] = header.SIZE_INDICATOR_MAX_VALUE; 

map[? "buffer"] = buffer_create(network_settings.PACKET_COLLECTOR_BUFFER_SIZE,
                                   buffer_fixed, 1);
map[? "header_size"] = header.MAGIC_NUMBER_SIZE + header.SIZE_INDICATOR_SIZE;
map[? "received_messages"] = ds_list_create();

return map;
