/// server_handle_requests(buffer, client_socket)
// - Preps the server_buffer for a response.
// - Executes the right request handler.
var buffer = argument0;
var client_socket = argument1;

// Determine which request was sent.
var request = buffer_read(buffer, buffer_u8);

// Prepare the server_buffer for a new response.
server_prepare_buffer(server_buffer, request);

// Choose the right request handler.
switch (request) {
    case R_IDENTIFICATION: {
        server_handle_identification(buffer, client_socket);
    } break;
    default: {
        console_print("Recieved unkwown request.");
    }
}
// Delete the now redundant buffer.
buffer_delete(buffer);
