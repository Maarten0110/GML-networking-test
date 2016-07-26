var name = argument0;
var ERROR = power(10, -2);
var client = client_create("",0,0,0);
var buffer = client[? "buffer"];
var read;
client_buffer_write(client, buffer_s8, 3);
client_buffer_write(client, buffer_s16, -3412);
client_buffer_write(client, buffer_s32, 540210493);
client_buffer_write(client, buffer_string, "Testbericht!");
client_buffer_write(client, buffer_f32, 43123.321957);
client_buffer_write(client, buffer_f64, 123.301293);
buffer_seek(buffer, buffer_seek_start, 0);
buffer_resize(buffer, client[? "buffer_size"]);

UT_test_output(
    client[? "buffer_size"] == 165,
    name,
    "The buffer_size of the client is correct.",
    "The buffer_size of the client is incorrect. Expected 165 but was: "
        + string(client[? "buffer_size"]) + "."
);
read = buffer_read(buffer, buffer_s8);
UT_test_output( 
    read == 3,
    name,
    "The S8 integer was stored in the buffer correctly.",
    "The S8 integer was stored in the buffer incorrectly. Expected 3, but was "
        + string(read) + "."
);
read = buffer_read(buffer, buffer_s16);
UT_test_output( 
    read == -3412,
    name,
    "The S16 integer was stored in the buffer correctly.",
    "The S16 integer was stored in the buffer incorrectly. Expected -3412, but"
    + "was "+ string(read) + "."
);
read = buffer_read(buffer, buffer_s32);
UT_test_output( 
    read == 540210493,
    name,
    "The S32 integer was stored in the buffer correctly.",
    "The S32 integer was stored in the buffer incorrectly. Expected 540210493"
        + ", but was" + string(read) + "."
);
read = buffer_read(buffer, buffer_string);
UT_test_output( 
    read == "Testbericht!",
    name,
    "The string was stored in the buffer correctly.",
    'The string was stored in the buffer incorrectly. Expected "Testbericht!",'
        + ' but was "' + read + '".'
);
read = buffer_read(buffer, buffer_f32);
UT_test_output( 
    abs(read - 43123.321957) <  ERROR,
    name,
    "The F32 float was stored in the buffer correctly.",
    "The F32 float was stored in the buffer incorrectly. Expected 43123.321957"
        + ", but was" + string_format(read, 5, 9) + "."
);
read = buffer_read(buffer, buffer_f64);
UT_test_output( 
    abs(read - 123.301293) < ERROR,
    name,
    "The S64 float was stored in the buffer correctly.",
    "The S64 float was stored in the buffer incorrectly. Expected 123.301293,"
        + " but was" + string_format(read, 3, 9) + "."
);
buffer_delete(buffer);
ds_map_destroy(client);

