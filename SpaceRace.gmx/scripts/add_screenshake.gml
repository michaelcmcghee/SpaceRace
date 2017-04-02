///add screenshake(amount, duration)
var amount = argument0;
var duration = argument1;

if(instance_exists(o_view_controller)){
    o_view_controller.screenshake = amount;   
    o_view_controller.alarm[SCREENSHAKE] = duration;   
}else{
    show_error("The view controller isn't in the room.", true);
}

