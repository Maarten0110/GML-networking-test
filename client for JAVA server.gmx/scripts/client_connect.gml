/// client_connect(client, attempts)
// Attempts to connect the server. Returns true when a connection is made and,
// false when not.
var client = argument0;
var attempts = argument1;

// Try to connect the given amount of times.
repeat (attempts) {

    // Destroy old socket.
    if (client[? "socket"] != undefined) 
        network_destroy(client[? "socket"]);
    
    // Create new socket.
    client[? "socket"] = network_create_socket(network_socket_tcp);
    network_set_timeout(client[? "socket"], client[? "read_timeout"],
                        client[? "write_timeout"]);
    
    // Connect. If connection attempt succeeded return true.
    if (network_connect_raw(client[? "socket"], client[? "ip"],
                            client[? "port"]) == 0)
        return true;
        
}
return false;
