/// packet_collector_add_packet(packet_collector, buffer, size)
// Adds a received packet to the internal buffer of the packet_collector.
var pc = argument0;
var buffer = argument1;
var size = argument2;
buffer_copy(buffer, 0, size, pc[? "buffer"], pc[? "buffer_size"]);
               
pc[? "buffer_size"] += size;
buffer_delete(buffer);
