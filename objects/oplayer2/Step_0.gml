///varibles for movemnt
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
//calcs movement
var move = (key_right-key_left)*-1;
//movement
horzspd = move * walksp;
vertspd = vertspd + grav;

//checking for win stage 1


	
	//vertical jump
if(place_meeting(x,y+1,owall)) && (keyboard_check_pressed(vk_space))
{
	vertspd = -10;
}

//creating collision between the wall and the player
if(place_meeting(x+horzspd,y,owall))
{
	while(!place_meeting(x+sign(horzspd),y,owall))
	{
		x = x + sign(horzspd);
	}
	horzspd = 0;
}

	//creating collision between the wall and the player
if(place_meeting(x,y+vertspd,owall))
{
	while(!place_meeting(x,y+sign(vertspd),owall))
	{
		y = y + sign(vertspd);
	}
	vertspd = 0;	
}
//checking if the player has hit the snacks
var othero = instance_place(x, y,osnack);
if(place_meeting(x,y,osnack))
{
	instance_destroy(othero);
	oplayer.check++;
}

//lava check
if(place_meeting(x,y,olava))
{
	olava.rise = 0;
	instance_destroy();
	room_goto(failure);
}

x = x + horzspd;
y = y + vertspd;