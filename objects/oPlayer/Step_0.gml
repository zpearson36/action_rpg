/// @description Insert description here
// You can write your code in this editor
event_inherited()
switch(state)
{
	case PLAYERSTATES.IDLE:
	{
		if(global.move_left and global.move_up)
		{
			facing = FACING.UPLEFT
			state = PLAYERSTATES.WALKING
			break;
		}
		if(global.move_left and global.move_down)
		{
			facing = FACING.DOWNLEFT
			state = PLAYERSTATES.WALKING
			break;
		}
		if(global.move_right and global.move_up)
		{
			facing = FACING.UPRIGHT
			state = PLAYERSTATES.WALKING
			break;
		}
		if(global.move_right and global.move_down)
		{
			facing = FACING.DOWNRIGHT
			state = PLAYERSTATES.WALKING
			break;
		}
		if(global.move_left)
		{
			facing = FACING.LEFT
			state = PLAYERSTATES.WALKING
			break;
		}
		if(global.move_right)
		{
			facing = FACING.RIGHT
			state = PLAYERSTATES.WALKING
			break;
		}
		if(global.move_up)
		{
			facing = FACING.UP
			state = PLAYERSTATES.WALKING
			break;
		}
		if(global.move_down)
		{
			facing = FACING.DOWN
			state = PLAYERSTATES.WALKING
			break;
		}
		if(global.move_x)
		{
			state = PLAYERSTATES.WINDUP
			break;
		}
		break;
	}
	case PLAYERSTATES.WALKING:
	{
		if(global.move_b)
		{
			spd *= dash_multiplyer
			alarm[1] = 5
		}
		if(global.move_x)
		{
			state = PLAYERSTATES.WINDUP
			break;
		}
		if(global.move_left and global.move_up)         facing = FACING.UPLEFT
		else if(global.move_left and global.move_down)  facing = FACING.DOWNLEFT
		else if(global.move_right and global.move_up)   facing = FACING.UPRIGHT
		else if(global.move_right and global.move_down) facing = FACING.DOWNRIGHT
		else if(global.move_left)                       facing = FACING.LEFT
		else if(global.move_right)                      facing = FACING.RIGHT
		else if(global.move_up)                         facing = FACING.UP
		else if(global.move_down)                       facing = FACING.DOWN
		else                                            {state = PLAYERSTATES.IDLE; break;}
		
		switch(facing)
		{
			case FACING.UP:
			{
				if(collision_circle(x, y - spd, sprite_size / 2, oCollidable, false, true))
				{
					while(not collision_circle(x, y - 1, sprite_size / 2, oCollidable, false, true))
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
	case PLAYERSTATES.WINDUP:
	{
		if(attack != undefined) state = PLAYERSTATES.ATTACK
		break
	}
	case PLAYERSTATES.ATTACK:
	{
		if(attack == undefined) state = PLAYERSTATES.IDLE
		break
	}
}