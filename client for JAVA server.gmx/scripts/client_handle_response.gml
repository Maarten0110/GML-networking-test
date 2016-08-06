/// client_handle_response(request_that_was_responded_to, buffer)
// Calls the right response handler.
var r = argument0;
var buffer = argument1;

switch (r) {
    
    case requests.DEBUG: client_handle_DEBUG(buffer); break;
    case requests.PUT_NAME: client_handle_PUT_NAME(buffer); break;
    
    default: show_error("Received unknown response.", false);
}
