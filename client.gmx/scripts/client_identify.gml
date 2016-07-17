/// client_identify(socket, buffer, string name);
buffer_resize(argument1, 8);
buffer_seek(argument1, buffer_seek_start, 0);

buffer_write(buffer, buffer_u8, M_IDENTIFICATION);
buffer_write(buffer, buffer_string, argument2);

network_send_packet(argument0, buffer, buffer_get_size(buffer));
