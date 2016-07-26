/// client_create(ip, port, read_time_out, write_time_out)
// Configure network settings, client info and create socket.
var ip = argument0;
var port = argument1;
var read_timeout = argument2;
var write_timeout = argument3;

var client = ds_map_create();

client[? "socket"] = undefined;
client[? "ip"] = ip;
client[? "port"] = port;
client[? "buffer"] = buffer_create(1, buffer_grow, 1);
client[? "buffer_size"] = 0;
client[? "read_timeout"] = read_timeout;
client[? "write_timeout"] = write_timeout;

return client;
