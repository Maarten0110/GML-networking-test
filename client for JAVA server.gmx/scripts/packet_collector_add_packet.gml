/// packet_collector_add_packet(packet_collector, buffer)
// Adds a recieved packet to the internal buffer of the packet_collector.
var packet_collector = argument0;
var buffer = argument1;

var size = buffer_get_size(buffer);
buffer_copy(buffer, 0, size, packet_collector[? "buffer"],
               packet_collector[? "buffer_size"] + 1);
               
packet_collector[? "buffer_size"] += size;
buffer_delete(buffer);
