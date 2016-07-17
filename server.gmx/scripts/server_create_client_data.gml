/// server_create_client_data(socket_id)

// creates and returns a ds_map to hold client_data

var socket_id = argument0;
var map = ds_map_create();

ds_map_add(map, "socket", socket_id); // socket id
ds_map_add(map, "ip", "NULL"); // client ip
ds_map_add(map, "logging_off", false); // is client 
                                       // about to
                                       // log off?
ds_map_add(map, "name", "NULL"); // client name

return map;
