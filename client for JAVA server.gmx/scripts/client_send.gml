/// client_send(client)
// Sends the client buffer in its current state. Prepares the buffer for the
// next request.
var client = argument0;

var buffer = client[? "buffer"];
buffer_resize(buffer, client[? "buffer_size"]);
network_send_raw(client[? "socket"], buffer,
                    buffer_get_size(buffer));

buffer_resize(buffer, 1);
buffer_seek(buffer, buffer_seek_start, 0);
client[? "buffer_size"] = 0;
