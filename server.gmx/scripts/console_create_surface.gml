/// console_create_surface
var size = power(2, ceil(log2(max(console_width, console_height))));
return surface_create(size, size);
