/// connect()
// attempts to connect to the server
var socket = network_create_socket(network_socket_tcp);
network_connect(socket, SERVER_IP, PORT);

return socket;
