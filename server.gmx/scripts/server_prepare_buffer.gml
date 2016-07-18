/// server_prepare_buffer(buffer, request_to_respond_to)
// Prepares the given buffer to be sent as a response.

buffer_resize(argument0, 8);
buffer_seek(argument0, buffer_seek_start, 0);

// Write the request to which this will be a response
// to the buffer.
buffer_write(argument0, buffer_u8, argument1);
