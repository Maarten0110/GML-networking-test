name = argument0;
var o = instance_create(0,0, UT_test_object);

with (o) {
    // Setup a similar environment as the real server.
    console_setup();
    server_clients = ds_map_create();
    server_disconnected_clients = ds_map_create();
    
    // Setup a situation in which all branches of the
    // script can be tested.
    client_data1 = server_create_client_data(1);
    server_set_client_info(client_data1, "ip", "IPADRESS.1");
    server_set_client_info(client_data1, "name", "CLIENT1");
    server_set_client_info(client_data1, "logging_off", true);
    
    client_data2 = server_create_client_data(2);
    server_set_client_info(client_data2, "ip", "IPADRESS.2");
    server_set_client_info(client_data2, "name", "CLIENT1");
    server_set_client_info(client_data2, "logging_off", false);

    ds_map_add(server_clients, 1, client_data1);
    ds_map_add(server_clients, 2, client_data2);
    
    // Execute the script that is to be tested. There are
    // 2 scenarios, because there are 2 branches in the
    // script.
    server_handle_client_disconnection(1);
    server_handle_client_disconnection(2);
    
    // Check if the things that should have happened have
    // actually happened.
    UT_test_output(
        !ds_map_exists(server_clients, client_data1),
        other.name,
        "Logged off client was deleted from server_clients.",
        "Logged off client was not deleted from server_clients.");
    
    UT_test_output(
        !ds_map_exists(server_disconnected_clients, "IPADRESS.1"),
        other.name,
        "Logged off client was not added to server_disconnected_clients.",
        "Logged off client was added to server_disconnected_clients."); 

    UT_test_output(
        !ds_map_exists(server_clients, client_data2),
        other.name,
        "Disconnected client was deleted from server_clients.",
        "Disconnected client was not deleted from server_clients.");
    
    UT_test_output(
        ds_map_exists(server_disconnected_clients, "IPADRESS.2"),
        other.name,
        "Disconnected client was added to server_disconnected_clients.",
        "Disconnected client was not added to server_disconnected_clients."); 

    // clean up
    ds_map_destroy(server_clients);
    ds_map_destroy(server_disconnected_clients);
    ds_map_destroy(client_data2);
    console_destroy();
    instance_destroy();
}
