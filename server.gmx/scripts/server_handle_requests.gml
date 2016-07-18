/// server_handle_requests(buffer, client_socket)

var buffer = argument0;
var client_socket = argument1;
var request = buffer_read(buffer, buffer_u8);

server_prepare_buffer(server_buffer, request);

switch (request) {
    case R_IDENTIFICATION: {
        server_handle_identification(buffer, client_socket);
    } break;
    default: {
        console_print("Recieved unkwown request.");
    }
}
buffer_delete(buffer);
