/// @description Insert description here
// You can write your code in this editor
/*

*/

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
		if(global.move_action)
		{
			var x_offset = 0
			var y_offset = 0
			var rotation = 0
			var offset_mag = 64
			switch(facing)
			{
				case FACING.UP:
				{
					y_offset = -offset_mag
					rotation =  90
					break;
				}
				case FACING.DOWN:
				{
					y_offset =  offset_mag
					rotation =  270
					break;
				}
				case FACING.LEFT:
				{
					x_offset = -offset_mag
					rotation =  180
					break;
				}
				case FACING.RIGHT:
				{
					x_offset =  offset_mag
					rotation =  0
					break;
				}
				case FACING.UPLEFT:
				{
					x_offset = -offset_mag * cos(degtorad(45))
					y_offset = -offset_mag * cos(degtorad(45))
					rotation =  135
					break;
				}
				case FACING.UPRIGHT:
				{
					x_offset =  offset_mag * cos(degtorad(45))
					y_offset = -offset_mag * cos(degtorad(45))
					rotation =  45
					break;
				}
				case FACING.DOWNLEFT:
				{
					x_offset = -offset_mag * cos(degtorad(45))
					y_offset =  offset_mag * cos(degtorad(45))
					rotation =  225
					break;
				}
				case FACING.DOWNRIGHT:
				{
					x_offset =  offset_mag * cos(degtorad(45))
					y_offset =  offset_mag * cos(degtorad(45))
					rotation =  310
					break;
				}
			}
			attack = instance_create_layer(x + x_offset, y + y_offset, "attack", oAttack)
			attack.rotation = rotation
			state = PLAYERSTATES.ATTACK
			alarm[0] = 5
			break;
		}
		break;
	}
	case PLAYERSTATES.WALKING:
	{
		
		if(global.move_action)
		{
			var x_offset = 0
			var y_offset = 0
			var rotation = 0
			var offset_mag = 64
			switch(facing)
			{
				case FACING.UP:
				{
					y_offset = -offset_mag
					rotation =  90
					break;
				}
				case FACING.DOWN:
				{
					y_offset =  offset_mag
					rotation =  270
					break;
				}
				case FACING.LEFT:
				{
					x_offset = -offset_mag
					rotation =  180
					break;
				}
				case FACING.RIGHT:
				{
					x_offset =  offset_mag
					rotation =  0
					break;
				}
				case FACING.UPLEFT:
				{
					x_offset = -offset_mag * cos(degtorad(45))
					y_offset = -offset_mag * cos(degtorad(45))
					rotation =  135
					break;
				}
				case FACING.UPRIGHT:
				{
					x_offset =  offset_mag * cos(degtorad(45))
					y_offset = -offset_mag * cos(degtorad(45))
					rotation =  45
					break;
				}
				case FACING.DOWNLEFT:
				{
					x_offset = -offset_mag * cos(degtorad(45))
					y_offset =  offset_mag * cos(degtorad(45))
					rotation =  225
					break;
				}
				case FACING.DOWNRIGHT:
				{
					x_offset =  offset_mag * cos(degtorad(45))
					y_offset =  offset_mag * cos(degtorad(45))
					rotation =  310
					break;
				}
			}
			attack = instance_create_layer(x + x_offset, y + y_offset, "attack", oAttack)
			attack.rotation = rotation
			state = PLAYERSTATES.ATTACK
			alarm[0] = 5
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
				y -= spd
				subimg = 4
				break;
			}
			case FACING.DOWN:
			{
				y += spd
				subimg = 0
				break;
			}
			case FACING.LEFT:
			{
				x -= spd
				subimg = 6
				break;
			}
			case FACING.RIGHT:
			{
				x += spd
				subimg = 2
				break;
			}
			case FACING.UPLEFT:
			{
				y -= spd * cos(degtorad(45))
				x -= spd * cos(degtorad(45))
				subimg = 5
				break;
			}
			case FACING.UPRIGHT:
			{
				y -= spd * cos(degtorad(45))
				x += spd * cos(degtorad(45))
				subimg = 3
				break;
			}
			case FACING.DOWNLEFT:
			{
				y += spd * cos(degtorad(45))
				x -= spd * cos(degtorad(45))
				subimg = 7
				break;
			}
			case FACING.DOWNRIGHT:
			{
				y += spd * cos(degtorad(45))
				x += spd * cos(degtorad(45))
				subimg = 1
				break;
			}
		}
		break;
	}
	case PLAYERSTATES.ATTACK:
	{
		if(attack == undefined) state = PLAYERSTATES.IDLE
		break
	}
}