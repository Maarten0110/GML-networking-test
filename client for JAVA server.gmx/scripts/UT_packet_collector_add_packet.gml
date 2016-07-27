var name = argument0;

var pc = packet_collector_create();

var buff1 = buffer_create(10, buffer_fixed, 1);
var buff2 = buffer_create(18, buffer_fixed, 1);
buffer_write(buff1, buffer_string, "Hallo Yo!");
buffer_write(buff2, buffer_string, "Hallo daar! hihi!");
var read;

packet_collector_add_packet(pc, buff1, 10);
UT_test_output(
    pc[? "buffer_size"] == 10,
    name,
    "The value of the buffer_size key was updated correctly.",
    "The value of the buffer_size key was updated incorrectly. Expected 10,"
        + " but was " + string(pc[? "buffer_size"]) + "."
);
packet_collector_add_packet(pc, buff2, 18);
UT_test_output(
    pc[? "buffer_size"] == 28,
    name,
    "The value of the buffer_size key was updated correctly.",
    "The value of the buffer_size key was updated incorrectly. Expected 28,"
        + " but was " + string(pc[? "buffer_size"]) + "."
);
var buffer = pc[? "buffer"]; 
buffer_seek(buffer, buffer_seek_start, 0);
read = buffer_read(buffer, buffer_string);
UT_test_output(
    read == "Hallo Yo!",
    name,
    "The first packet was added correctly.",
    'The first packet was not added correctly. Expected "Hallo Yo!", but was "'
        + read + '".'
);
read = buffer_read(buffer, buffer_string);
UT_test_output(
    read == "Hallo daar! hihi!",
    name,
    "The second packet was added correctly.",
    'The second packet was not added correctly. Expected "Hallo daar! hihi!",'
        + 'but was "' + read + '".'
);
buffer_delete(buff1);
buffer_delete(buff2);
buffer_delete(pc[? "buffer"]);
ds_map_destroy(pc);
