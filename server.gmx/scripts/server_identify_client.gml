/// server_identify_client(socket, string name)
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
    show_error("This client(" + argument1
                + ") was never reported!",
                false);
    exit;
}
ds_list_delete(l, ds_list_find_index(l, C));
C.name = argument1;
ds_list_add(server_clients, C);
