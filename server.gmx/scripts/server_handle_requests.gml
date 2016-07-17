/// server_handle_requests(buffer, client_socket)

var buffer = argument0;
var client_socket = argument1;
var request = buffer_read(buffer, buffer_u8);

switch (request) {
    case M_IDENTIFICATION: {
        server_handle_identification(buffer, client_socket);
    } break;
    default: {
        console_print("Recieved unkwown request.");
    }
}
