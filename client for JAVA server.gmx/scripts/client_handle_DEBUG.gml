/// client_handle_DEBUG(buffer)
// Handles response to DEBUG request.
var buffer = argument0;

show_message(buffer_read(buffer, buffer_string));
buffer_delete(buffer);
