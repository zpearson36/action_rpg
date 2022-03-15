/// @description Insert description here
// You can write your code in this editor
c_color = c_white
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
attack = instance_create_layer(x + x_offset, y + y_offset, "attack", weapon.attack)
attack.rotation = rotation
alarm[11] = attack.lifetime