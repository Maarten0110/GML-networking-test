/// client_handle_response(buffer)
var buffer = argument0;

var response = buffer_read(buffer, buffer_u8);

switch (response) {
    
    case R_IDENTIFICATION:
        client_handle_response_identification(buffer);
    break;
    
    default:
        show_error("Recieved unknown response: "
                    + string(response) + ".", false);

}
buffer_delete(buffer);
