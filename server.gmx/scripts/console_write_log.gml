/// console_write_log
var filename = working_directory + "console_log ("
                + date_datetime_string(date_current_datetime())
                + ").txt";
var file = file_text_open_write(filename);
console_print(filename);
if (file == -1)
    return false;
    
file_text_write_string(file, ds_list_write(console_messages));
file_text_close(file);
return true;
