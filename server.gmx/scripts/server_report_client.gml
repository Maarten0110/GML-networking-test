/// server_report_client(socket, string ip)
var c = instance_create(0, 0, obj_client_data);
c.socket = argument0;
c.ip = argument1;
ds_list_add(server_unidentified_clients, c);
