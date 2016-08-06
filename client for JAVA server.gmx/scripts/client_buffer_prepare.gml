/// client_buffer_prepare(client)
// Prepares the buffer of the client for writing a new request.
var client = argument0;

var buffer = client[? "buffer"];
buffer_resize(buffer, 1);
buffer_seek(buffer, buffer_seek_start, 0);
client[? "buffer_size"] = 0;
client_buffer_write(client, header.MAGIC_NUMBER_TYPE, header.MAGIC_NUMBER);
