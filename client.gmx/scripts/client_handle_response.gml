/// client_handle_response(buffer)
// - Determines which request was responded to.
// - Executes the right response handler.
// - Destroys the now redundant buffer that
//   contains the response.

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
