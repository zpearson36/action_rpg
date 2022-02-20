/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if(target != undefined)
{
	var t_direction = point_direction(x, y, target.x, target.y)
}
switch(state)
{
	case PLAYERSTATES.IDLE:
	{
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