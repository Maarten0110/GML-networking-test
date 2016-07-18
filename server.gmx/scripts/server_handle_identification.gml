/// server_handle_identification(buffer, client_socket)
// Handles an identification request (the clients tells
// the server its name) and responds accordingly.

// read the name of the client from the buffer sent
// with the request.
var buffer = argument0;
var client_socket = argument1;
var name = buffer_read(buffer, buffer_string);

// add client info to client data of the right client
var client_data = server_get_client_data(client_socket);
server_set_client_info(client_data, "name", name);

console_print("Client (" + string(client_socket)
                + ") identified itself as "
                + name + ".");

// SEND RESPONSE
if (object_index == UT_test_object) exit; // Don't try to send
                                          // a message during
                                          // unit tests.
buffer_write(server_buffer, buffer_bool, true);
server_send_response(client_socket, server_buffer);
