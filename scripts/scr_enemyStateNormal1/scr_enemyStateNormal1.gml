function scr_enemyStateNormal1(){

//ACELERAÇÃO GRAVITACIONAL
vsp = vsp + grav;

//COLISÃO HORIZONTAL
if(place_meeting(x+hsp,y,obj_block))
{
	while(!place_meeting(x+sign(hsp),y,obj_block))
	{
		x = x + sign(hsp);
		
	}

	hsp *= -1;
}

x = x+hsp;


//COLISÃO VERTICAL
if(place_meeting(x,y+vsp,obj_block))
{
	while(!place_meeting(x,y+sign(vsp),obj_block))
	{
		y = y + sign(vsp);
	}
	vsp = 0
}

y = y+vsp;

//DANO
if(place_meeting(x,y,obj_slash)){
	with (instance_nearest(x, y, obj_slash)) instance_destroy();
	ENEMYSTATE = ENEMYSTATE.HURT;
}else if(place_meeting(x,y,obj_lightorb)){
	with (instance_nearest(x, y, obj_lightorb)) instance_destroy();
	ENEMYSTATE = ENEMYSTATE.HURT;	
}


scr_enemyJump();
scr_enemyWalk(spr_skeletonwalk);
scr_enemyStateShoot1(obj_bone);
}