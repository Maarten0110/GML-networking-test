var name = argument0;

var pc = packet_collector_create();
var buff = buffer_create(header.MAGIC_NUMBER_SIZE, buffer_fixed, 1);
buffer_write(buff, header.MAGIC_NUMBER_TYPE, header.MAGIC_NUMBER);

// Add a packet, nothing should change.
packet_collector_add_packet(pc, buff, buffer_get_size(buff));
buffer_delete(buff);
UT_test_output(
    pc[? "state"] == packet_collector_states.WAITING,
    name,
    "The starting state of the p.c. is indeed WAITING.",
    "The starting state of the p.c. is not WAITING, but: "
        + string(pc[? "state"]) + "."
)
// Try to find a message, still nothing should change.
packet_collector_find_message(pc);
UT_test_output(
    pc[? "state"] == packet_collector_states.WAITING,
    name,
    "The state of the p.c. is still WAITING after the first part of the header"
        + " is recieved.",
    "The state of the p.c. is not WAITING after the first part of the header "
        + "was recieved, but: " + string(pc[? "state"]) + "."
);
// Add packet with size indicator and part of the message body, state should
// change to READING.
buff = buffer_create(header.SIZE_INDICATOR_SIZE + 5, buffer_fixed, 1);
buffer_write(buff, header.SIZE_INDICATOR_TYPE, 10);
buffer_write(buff, buffer_string, "hoi!");
packet_collector_add_packet(pc, buff, buffer_get_size(buff));
buffer_delete(buff);
packet_collector_find_message(pc);
UT_test_output(
    pc[? "state"] == packet_collector_states.READING,
    name,
    "The state of the p.c. is READING after the complete header was recieved.",
    "The state of the p.c. is not READING after the complete header was "
        + "recieved, but: " + string(pc[? "state"]) + "."
);
UT_test_output(
    pc[? "target_size"] == 10,
    name,
    "The target_size was updated correctly.",
    "The target_size was not updated correctly. Expected 10, but was "
        + string(pc[? "target_size"]) + "."
);
// Add packet with final part of message body and the beginning of a new
// message.
buff = buffer_create(5 + pc[? "header_size"] + 7 + header.MAGIC_NUMBER_SIZE,
                        buffer_fixed, 1);
buffer_write(buff, buffer_string, "hai!");
buffer_write(buff, header.MAGIC_NUMBER_TYPE, header.MAGIC_NUMBER);
buffer_write(buff, header.SIZE_INDICATOR_TYPE, 7);
buffer_write(buff, buffer_string, "hallo!");
buffer_write(buff, header.MAGIC_NUMBER_TYPE, header.MAGIC_NUMBER);
packet_collector_add_packet(pc, buff, buffer_get_size(buff));
buffer_delete(buff);
packet_collector_find_message(pc);
var list = pc[? "recieved_messages"];
var read;
// The message bodies should have been stored in recieved_message
UT_test_output(
    ds_list_size(list) == 2,
    name,
    "The two message bodies have been found.",
    "An incorrect number of message bodies have been found. Expected 2, but was"
        + " " + string(ds_list_size(list)) + "."
);
var test = ds_list_find_value(list, 0);
UT_test_output(
    buffer_get_size(test) == 10,
    name,
    "The first message body has the correct size.",
    "The first message body has an incorrect size. Expected 10, but was "
        + string(buffer_get_size(test)) + "."
);
read = buffer_read(test, buffer_string);
UT_test_output(
    read == "hoi!",
    name,
    "The first part of the first message body was read succesfully.",
    'The first part of the first message body was not read succesfully. Expected '
        + '"hoi!" but was "' + read + '".'
);
read = buffer_read(test, buffer_string);
UT_test_output(
    read == "hai!",
    name,
    "The second part of the first message body was read succesfully.",
    'The second part of the first message body was not read succesfully. Expected '
        + '"hai!" but was "' + read + '".'
);
buffer_delete(test);
test = ds_list_find_value(list, 1);
UT_test_output(
    buffer_get_size(test) == 7,
    name,
    "The second message body has the correct size.",
    "The second message body has an incorrect size. Expected 7, but was "
        + string(buffer_get_size(test)) + "."
);
read = buffer_read(test, buffer_string);
UT_test_output(
    read == "hallo!",
    name,
    "The second message body was read succesfully.",
    'The second message body was not read succesfully. Expected '
        + '"halo!" but was "' + read + '".'
);
buffer_delete(test);
// The remaining part of the p.c. buffer should be placed a the front, also the
// buffer_size should have been updated.
test = pc[? "buffer"];
buffer_seek(test, buffer_seek_start, 0);
read = buffer_read(test, header.MAGIC_NUMBER_TYPE)
expected = header.MAGIC_NUMBER;
UT_test_output(
    read == expected,
    name,
    "The remaining part of the p.c. buffer was moved to the front correctly.",
    "The remaining part of the p.c. buffer was moved to the front incorrectly."
        + " Expected " + string(expected) + ", but was " + string(read) + "."
);
UT_test_output(
    pc[? "buffer_size"] == header.MAGIC_NUMBER_SIZE,
    name,
    "buffer_size was updated correctly.",
    "buffer_size was updated incorrectly. Expected "
        + string(header.MAGIC_NUMBER_SIZE) + ", but was "
        + string(pc[? "buffer_size"]) + "."
);

ds_list_destroy(list);
buffer_delete(pc[? "buffer"]);
ds_map_destroy(pc);
