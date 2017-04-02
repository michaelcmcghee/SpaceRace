///create_part_type_sprite(sprite, blend, min_life, max_life)

var sprite = argument0;
var blend = argument1;
var min_life = argument2;
var max_life = argument3;

var type = part_type_create();
part_type_alpha2(type, .75, 0);
part_type_sprite(type, sprite, false, true, false);
part_type_blend(type, blend);
part_type_size(type, 1, 1, 0, 0);
part_type_life(type, min_life, max_life);
part_type_orientation(type, 0, 360, 0, 0, 0);

return type; 
