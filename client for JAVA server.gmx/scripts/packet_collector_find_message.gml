/// packet_collector_find_message(packet_collector)
// Checks if a complete message has been recieved yet. If so, fire the user
// defined event number 0.
var pc = argument0;

var buffer = pc[? "buffer"];
var buffer_size = pc[? "buffer_size"];
var header_size = pc[? "header_size"];

switch (pc[? "state"]) {

    case packet_collector_states.WAITING: {
        
        // If the header has been completely recieved, then get the size of the
        // message that is to come, and change the state to READING.
        if (buffer_size >= header_size) {
            
            buffer_seek(buffer, buffer_seek_start, 0);
            // TO-DO waarom eigenlijk een magic number :O
            var magic_number = buffer_read(buffer, header.MAGIC_NUMBER_TYPE);
            if (magic_number != header.MAGIC_NUMBER)
                show_error("Incorrect magic number: " + string(magic_number),
                               true);
            
            // Get the size of the body of the incoming message:
            pc[? "target_size"] = buffer_read(buffer,
                                                 header.SIZE_INDICATOR_TYPE);
            pc[? "state"] = packet_collector_states.READING;
       
        }
    } // There is no 'break' here on purpose!
    
    case packet_collector_states.READING: {
        
        // If the entire message has been recieved, then copy this message to
        // a new buffer, and put the remaining bytes at the start of the buffer
        // and change the buffer_size accordingly.
        var target_size = pc[? "target_size"];
        if (buffer_size - header_size >= target_size) {
           
            // Only take the MessageBody from the buffer:
            // buffer{ MagicNumber|SizeIndicator|Messagebody|Nextmessage }
            var new_buffer = buffer_create(target_size, buffer_fixed, 1);
            buffer_copy(buffer, header_size, target_size, new_buffer, 0);
            ds_list_add(pc[? "recieved_messages"], new_buffer);
           
            // Put the Nextmessage part in front of the packet_collector
            // buffer.
            var size = buffer_size - target_size - header_size;
            var temp_buffer = buffer_create(size, buffer_fixed, 1);
            buffer_copy(buffer, header_size+target_size, size, temp_buffer, 0);
            buffer_copy(temp_buffer, 0, size, buffer, 0);
            
            // Change the buffer size accordingly.
            pc[? "buffer_size"] = size;
           
            // Fire user defined event number 0.
            event_perform(ev_other, ev_user0);
            
            // Change state back to WAITING.
            pc[? "state"] = packet_collector_states.WAITING;
            pc[? "target_size"] = header.SIZE_INDICATOR_MAX_VALUE;
            
            // Call this script again if there is a chance that two messages
            // arrived at the same time.
            if (buffer_size >= pc[? "header_size"])
                packet_collector_find_message(pc);
        }
    } break;
    
    default: {
        show_error("packet_collector has an unknown state!", false);
    }

}
