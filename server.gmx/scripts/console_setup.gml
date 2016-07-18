/// console_setup()
// Setup some variables, datastructures and surfaces
// for the creation and visualization of the console.

console_x = 0; // x-coord of the console in the room
console_y = room_height/2; // y-coord of the console
                           // in the room
console_width = room_width-1;
console_height = room_height/2-1;
// surface to draw the console on:
console_surface = surface_create_power2(
                    console_width, console_height); 
    
console_messages = ds_list_create(); // list to store
                                     // console prints
                                     // in
console_messages_size = 0; // size of the list
console_text = ""; // text of the console (gets filled
                   // when console_update is called)
console_title_height = 15;
console_text_y = console_title_height+2;
console_text_y_start = console_text_y;
console_line_height = 13; // the height of each line,
                          // used when drawing the
                          // text with draw_tex_ext()
