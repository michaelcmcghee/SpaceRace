get_input();

if(obj_input.dash_key){
    var xdir = lengthdir_x(8, face*90);
    var ydir = lengthdir_y(8, face*90);
    var speaker = instance_place(x+xdir, y+ydir, obj_speaker);  
    
    if(speaker != noone){
        with(speaker){
        if(!instance_exists(dialog)){
            dialog = instance_create(x+xoffset, y+yoffset, obj_dialog);
            dialog.text = text;   
        }else{
            dialog.text_page++;
            dialog.text_count = 0;
            if(dialog.text_page > array_length_1d(dialog.text)-1){
                with(dialog){
                    instance_destroy()
                }
            }
        }
    
}
    }else if(obj_player_stats.stamina >= BOMB_COST){
        state = scr_dash_state;
        alarm[0] = room_speed/8;
        obj_player_stats.stamina-=BOMB_COST;
        obj_player_stats.alarm[0] = room_speed;
    }
}
