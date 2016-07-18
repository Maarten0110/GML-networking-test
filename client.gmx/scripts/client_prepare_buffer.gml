/// client_prepare_buffer(buffer, request)

buffer_resize(argument0, 8);
buffer_seek(argument0, buffer_seek_start, 0);
buffer_write(argument0, buffer_u8, argument1);
