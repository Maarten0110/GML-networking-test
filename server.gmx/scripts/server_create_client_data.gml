/// server_create_client_data(socket_id)
// Creates and returns a ds_map to hold client_data.

var socket_id = argument0;
var map = ds_map_create();

// New types of client info should be added here:
map[? "socket"]      = socket_id; // socket id
map[? "ip"]          = "NULL"; // client ip
map[? "logging_off"] = false; // is client about
                              // to log off?
map[? "name"]        = "NULL"; // client name

return map;
