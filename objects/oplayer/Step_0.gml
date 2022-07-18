///varibles for movemnt
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
//calcs movement
var move = key_right-key_left;
//movement
horzspd = move * walksp;
vertspd = vertspd + grav;

//checking for win stage 1
if(check == 2) && (room == stage1)
{
	vertspd = 0;
	horzspd = 0;
	check = 0;
	room_goto(stage2);
}
else if (check = 4) && (room == stage2)
{
	vertspd = 0;
	horzspd = 0;
	check = 0;
	room_goto(stage3);
}
else if (check = 5) && (room == stage3)
{
	vertspd = 0;
	horzspd = 0;
	check = 0;
	room_goto(stage4);
}
else if (check = 5) && (room == stage4)
{
	vertspd = 0;
	horzspd = 0;
	check = 0;
	room_goto(victory);
}
else
	{
	//vertical jump
	if(place_meeting(x,y+1,owall)) && (keyboard_check_pressed(vk_space)) && (room != stage4)
	{
		vertspd = -10;
	}
	//spceal jump type for stage four
	else if(room == stage4) && (keyboard_check_pressed(vk_space))
	{
		vertspd = vertspd*-1;
		grav = grav*-1;
		
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
		check++;
	}

	//lava check
	if(place_meeting(x,y,olava))
	{
		olava.rise = 0;
		check = 0;
		instance_destroy();
		room_goto(failure);
	}
}



x = x + horzspd;
y = y + vertspd;