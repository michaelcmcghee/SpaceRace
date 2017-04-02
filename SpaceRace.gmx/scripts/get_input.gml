///get_input
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);
dash_key = keyboard_check_pressed(ord('C'));
attack_key = keyboard_check_pressed(ord('X'));
pause_key = keyboard_check_pressed(ord('Z'));
spell_key = keyboard_check_pressed(ord('V'));
block_key = keyboard_check_pressed(ord('B'));

//get the axis
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);

//check for gamepad input
if(gamepad_is_connected(0)){
    gamepad_set_axis_deadzone(0, .35); //originally .35
    xaxis = gamepad_axis_value(0, gp_axislh);
    yaxis = gamepad_axis_value(0, gp_axislv);
    gp_up = gamepad_button_check_pressed(0, gp_padu);
    gp_down = gamepad_button_check_pressed(0, gp_padd);
    gp_left = gamepad_button_check_pressed(0, gp_padl);
    gp_right = gamepad_button_check_pressed(0, gp_padr);
    dash_key = gamepad_button_check_pressed(0, gp_face1); //A button
    attack_key = gamepad_button_check_pressed(0, gp_face3); //X button
    spell_key = gamepad_button_check_pressed(0, gp_face2); //B button
    block_key = gamepad_button_check_pressed(0, gp_face4); //Y button
    start_slow = gamepad_button_check_pressed(0, gp_shoulderr); //Right Bumper
    end_slow = gamepad_button_check_released(0, gp_shoulderr); //Right Bumper
    pause_key = gamepad_button_check_pressed(0, gp_start); //start button
}else{
    gp_down = false;
    gp_up = false;
}
