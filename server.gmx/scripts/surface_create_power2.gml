/// surface_create_power2(int width, int height)

// Returns a newly created surface with size n x n,
// with n is as small as possible while n > width
// and n > height, and n is a power of 2.

var size = power(2, ceil(log2(max(argument0, argument1))));
return surface_create(size, size);
