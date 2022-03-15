/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
event_inherited()
if(target != undefined)
{
	var t_direction = point_direction(x, y, target.x, target.y)
	if     (t_direction >=   0 and t_direction <  30) facing = FACING.RIGHT
	else if(t_direction >=  30 and t_direction <  60) facing = FACING.UPRIGHT
	else if(t_direction >=  60 and t_direction < 120) facing = FACING.UP
	else if(t_direction >= 120 and t_direction < 150) facing = FACING.UPLEFT
	else if(t_direction >= 150 and t_direction < 210) facing = FACING.LEFT
	else if(t_direction >= 210 and t_direction < 240) facing = FACING.DOWNLEFT
	else if(t_direction >= 240 and t_direction < 300) facing = FACING.DOWN
	else if(t_direction >= 300 and t_direction < 330) facing = FACING.DOWNRIGHT
	else if(t_direction >= 330 and t_direction < 360) facing = FACING.RIGHT
	
	alarm[0] = -1
	alarm[2] = -1
	
}
switch(state)
{
	case PLAYERSTATES.IDLE:
	{
		if(target != undefined)
		{
			if(point_distance(x, y, target.x, target.y) - sprite_size < weapon.reach)
			{
				state = PLAYERSTATES.WINDUP
				break;
			}
			else
			{
				state = PLAYERSTATES.WALKING
				break;
			}
		}
		switch(facing)
		{
			case FACING.UP:
			{
				subimg = 4
				break;
			}
			case FACING.DOWN:
			{
				subimg = 0
				break;
			}
			case FACING.LEFT:
			{
				subimg = 6
				break;
			}
			case FACING.RIGHT:
			{
				subimg = 2
				break;
			}
			case FACING.UPLEFT:
			{
				subimg = 5
				break;
			}
			case FACING.UPRIGHT:
			{
				subimg = 3
				break;
			}
			case FACING.DOWNLEFT:
			{
				subimg = 7
				break;
			}
			case FACING.DOWNRIGHT:
			{
				subimg = 1
				break;
			}
		}
		break;
	}
	case PLAYERSTATES.WALKING:
	{
		if(target != undefined)
		{
			if(point_distance(x, y, target.x, target.y) - sprite_size < weapon.reach)
			{
				state = PLAYERSTATES.WINDUP
				break;
			}
		}
		switch(facing)
		{
			case FACING.UP:
			{
				if(collision_circle(x, y - spd, sprite_size / 2, oCollidable, false, true))
				{
					while(not not collision_circle(x, y - 1, sprite_size / 2, oCollidable, false, true))
					{
						y--
					}
				}
				else y -= spd
				subimg = 4
				break;
			}
			case FACING.DOWN:
			{
				if(collision_circle(x, y + spd, sprite_size / 2, oCollidable, false, true))
				{
					while(not collision_circle(x, y + 1, sprite_size / 2, oCollidable, false, true))
					{
						y++
					}
				}
				else y += spd
				subimg = 0
				break;
			}
			case FACING.LEFT:
			{
				if(collision_circle(x - spd, y, sprite_size / 2, oCollidable, false, true))
				{
					while(not collision_circle(x - 1, y, sprite_size / 2, oCollidable, false, true))
					{
						x--
					}
				}
				else x -= spd
				subimg = 6
				break;
			}
			case FACING.RIGHT:
			{
				if(collision_circle(x + spd, y, sprite_size / 2, oCollidable, false, true))
				{
					while(not collision_circle(x + 1, y, sprite_size / 2, oCollidable, false, true))
					{
						x++
					}
				}
				else x += spd
				subimg = 2
				break;
			}
			case FACING.UPLEFT:
			{
				if(collision_circle(x - spd * cos(degtorad(45)), y - spd * cos(degtorad(45)), sprite_size / 2, oCollidable, false, true))
				{
					while(not collision_circle(x - 1, y - 1, sprite_size / 2, oCollidable, false, true))
					{
						x--
						y--
					}
				}
				else
				{
					y -= spd * cos(degtorad(45))
					x -= spd * cos(degtorad(45))
				}
				subimg = 5
				break;
			}
			case FACING.UPRIGHT:
			{
				if(collision_circle(x + spd * cos(degtorad(45)), y - spd * cos(degtorad(45)), sprite_size / 2, oCollidable, false, true))
				{
					while(not collision_circle(x + 1, y - 1, sprite_size / 2, oCollidable, false, true))
					{
						x++
						y--
					}
				}
				else
				{
					y -= spd * cos(degtorad(45))
					x += spd * cos(degtorad(45))
				}
				subimg = 3
				break;
			}
			case FACING.DOWNLEFT:
			{
				if(collision_circle(x - spd * cos(degtorad(45)), y + spd * cos(degtorad(45)), sprite_size / 2, oCollidable, false, true))
				{
					while(not collision_circle(x - 1, y + 1, sprite_size / 2, oCollidable, false, true))
					{
						x--
						y++
					}
				}
				else
				{
					y += spd * cos(degtorad(45))
					x -= spd * cos(degtorad(45))
				}
				subimg = 7
				break;
			}
			case FACING.DOWNRIGHT:
			{
				if(collision_circle(x + spd * cos(degtorad(45)), y + spd * cos(degtorad(45)), sprite_size / 2, oCollidable, false, true))
				{
					while(not collision_circle(x + 1, y + 1, sprite_size / 2, oCollidable, false, true))
					{
						x++
						y++
					}
				}
				else
				{
					y += spd * cos(degtorad(45))
					x += spd * cos(degtorad(45))
				}
				subimg = 1
				break;
			}
		}
		break;
	}
}