/// server_identify_client(socket, string name)
var socket = argument0;
var name = argument1;
var l = server_unidentified_clients;
var C = -1;

for (i = 0; i < ds_list_size(l); i ++) {
    var c = ds_list_find_value(l, i);
    if (c == socket) {
        C = c;
        break;
    }
};

if (C == -1) {
    show_error("This client(" + name
                + ") was never reported!",
                false);
    exit;
}
ds_list_delete(l, ds_list_find_index(l, C));
C.name = name1;
ds_list_add(server_clients, C);
