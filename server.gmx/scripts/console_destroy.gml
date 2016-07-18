/// console_destroy()
// Destroy unused structures that take up
// memory.

ds_list_destroy(console_messages);
surface_free(console_surface);
