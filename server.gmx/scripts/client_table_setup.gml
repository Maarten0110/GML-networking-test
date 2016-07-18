/// client_table_setup()
// Sets up a table to display client information.

client_table = table_create(0 ,0 , room_width/2,
                        room_height/2, "clients");
table_add_column(client_table, "socket", 60);
table_add_column(client_table, "ip", 120);
table_add_column(client_table, "name", 232);
table_add_column(client_table, "disconnected", 100);
