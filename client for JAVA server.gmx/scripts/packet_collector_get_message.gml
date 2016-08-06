/// packet_collector_get_message(packet_collector)
// Returns the oldest received message (which is a buffer) and deletes it from
// the packet_collector. If no messages are present in the packet_collector,
// -1 is returned.
var pc = argument0;

var received_messages = pc[? "received_messages"];
if (ds_list_empty(received_messages)) return -1;
var message = received_messages[| 0];
ds_list_delete(received_messages, 0);

return message;
