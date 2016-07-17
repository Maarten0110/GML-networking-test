name = argument0;
var o = instance_create(0,0, UT_test_object);

with (o) {
    console_setup();
    server_clients = ds_map_create();
    server_disconnected_clients = ds_map_create();
    client_data = server_create_client_data(13);
    server_set_client_info(client_data, "ip", "IPADRESS.13");
    server_set_client_info(client_data, "name", "CLIENT13");
    ds_map_add(server_disconnected_clients, "IPADRESS.13",
                client_data);

    server_handle_client_connection(99, "IPADRESS.13");
    server_handle_client_connection(2, "IPADRESS.2");
    
    UT_test_output(
        server_get_client_info(client_data, "socket") == 99,
        other.name,
        "Socket ID of reconnecting client was updated correctly.",
        "Socket ID of reconnecting client was not updated correctly. Expected 99 but was "
            + string(server_get_client_info(client_data, "socket"))
            + ".");
            
    UT_test_output(
        ds_map_exists(server_clients, 99),
        other.name,
        "Client data of reconnecting client is present in server_clients.",
        "Client data of reconnecting client is not present in server_clients.");
    
    UT_test_output(
        !ds_map_exists(server_disconnected_clients, "IPADRESS.13"),
        other.name,
        "Client data of reconnecting client was deleted from server_disconnected_clients.",
        "Client data of reconnecting client was not deleted from server_disconnected_clients.");
        
    UT_test_output(
        ds_map_exists(server_clients, 2),
        other.name,
        "Client data of the first-time connecting client was added to server_clients.",
        "Client data of the first-time connecting client was not added to server_clients.");
        
    UT_test_output(
        server_get_client_info(server_get_client_data(2), "ip") == "IPADRESS.2",
        other.name,
        "The ip adress of the first-time connecting client was stored correctly.",
        "The ip adress of the first-time connecting client was not stored "
            + "correctly. Expected IPADRESS.2 but was"
            + server_get_client_info(server_get_client_data(2), "ip") + ".");
    
    UT_test_output(
        server_get_client_info(server_get_client_data(2), "socket") == 2,
        other.name,
        "The socket ID of the first-time connecting client was stored correctly.",
        "The socket ID of the first-time connecting client was not stored "
            + "correctly. Expected 2 but was"
            + server_get_client_info(server_get_client_data(2), "ip") + ".");
    
    ds_map_destroy(server_get_client_data(2));
    ds_map_destroy(client_data); 
    ds_map_destroy(server_clients);
    ds_map_destroy(server_disconnected_clients);
    ds_list_destroy(console_messages); 
    instance_destroy();
}
