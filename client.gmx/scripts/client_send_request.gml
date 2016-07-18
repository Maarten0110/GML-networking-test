/// client_send_request(socket, buffer, request)

var socket = argument0;
var buffer = argument1;
var request = argument2;

client_prepare_buffer(buffer, request);

switch (request) {

    case R_IDENTIFICATION:
        client_request_identification(buffer);
    break;

    default: {
        show_error("Can't send unknown request: "
                    + string(request) + ".", false);
        exit;
    }
}

network_send_packet(socket, buffer, buffer_get_size(buffer));
