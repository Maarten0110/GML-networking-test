name = argument0;
var o = instance_create(0, 0, UT_test_object);

with (o) {
    // Setup a similar environment as the real server.
    console_setup();
    server_clients = ds_map_create();
    
    // Setup a situation in which all branches of the
    // script can be tested.
    var buffer = buffer_create(1, buffer_grow, 1);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_string, "clientname");
    buffer_seek(buffer, buffer_seek_start, 0);
    var client_data = server_create_client_data(1);
    ds_map_add(server_clients, 1, client_data);
    
    // Execute the script that is to be tested.
    server_handle_identification(buffer, 1);
    
    // Check if the things that should have happened have
    // actually happened.
    UT_test_output(
        server_get_client_info(client_data, "name")
            == "clientname",
        other.name,
        "Identifying client's name was set correctly.",
        "Identifying client's name was not set"
            + " correctly. Expected clientname but was "
            + server_get_client_info(client_data, "name")
            + ".");
    
    // clean-up
    ds_map_destroy(server_clients);
    console_destroy();
    instance_destroy();
}
