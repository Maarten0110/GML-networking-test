/// client_prepare_request(client, size, request)
// size = number of bytes of the data that is going to be written (without the
//        requestnumber bytes)
// request = one of the possible request constants (from requests enum)
var client = argument0;
var size = argument1;
var request = argument2;

client_buffer_write(client, header.SIZE_INDICATOR_TYPE,
                       header.REQUEST_SIZE + size);
client_buffer_write(client, header.REQUEST_TYPE, request);
