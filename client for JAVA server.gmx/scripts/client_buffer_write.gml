/// client_buffer_write(client, type, value)
// Takes the specified value of the given type and writes it to the buffer used
// in requests. Also tracks the size off the added data so the buffer can be
// properly resized before sending the request.
var client = argument0;
var type = argument1;
var value = argument2;

switch (type) {
    case buffer_s8:  client[? "buffer_size"] +=  8; break;
    case buffer_s16: client[? "buffer_size"] += 16; break;
    case buffer_s32: client[? "buffer_size"] += 32; break;
    case buffer_f32: client[? "buffer_size"] += 32; break;
    case buffer_f64: client[? "buffer_size"] += 64; break;
    case buffer_string:
        client[? "buffer_size"] += string_length(value) + 1; break;
    default: {
        show_error("This datatype is not supported by the server.", false);
        exit;
    }
    
}

buffer_write(client[? "buffer"], type, value);
