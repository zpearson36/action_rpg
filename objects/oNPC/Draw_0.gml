/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(target != undefined)
{
	draw_text( 50, 50, point_direction(x, y, target.x, target.y))
}

var x1 = 0
var y1 = 0
var l1x2 = 0
var l1y2 = 0
var l2x2 = 0
var l2y2 = 0
var l3x2 = 0
var l3y2 = 0
var spritesize = 64
var sightrange = 300
var sightwidth = 300
switch(facing)
{
	case FACING.UP:
	{
		x1 = x
		y1 = y - (spritesize / 2)
		l1x2 = x1
		l1y2 = y1 - sightrange
		l2x2 = x1 - (sightwidth / 2)
		l2y2 = l1y2
		l3x2 = x1 + (sightwidth / 2)
		l3y2 = l1y2
		break;
	}
	case FACING.DOWN:
	{
		x1 = x
		y1 = y + (spritesize / 2)
		l1x2 = x1
		l1y2 = y1 + sightrange
		l2x2 = x1 - (sightwidth / 2)
		l2y2 = l1y2
		l3x2 = x1 + (sightwidth / 2)
		l3y2 = l1y2
		break;
	}
	case FACING.LEFT:
	{
		x1 = x - (spritesize / 2)
		y1 = y
		l1x2 = x1 - sightrange
		l1y2 = y1
		l2x2 = l1x2
		l2y2 = y1 - (sightwidth / 2)
		l3x2 = l1x2
		l3y2 = y1 + (sightwidth / 2)
		break;
	}
	case FACING.RIGHT:
	{
		x1 = x + (spritesize / 2)
		y1 = y
		l1x2 = x1 + sightrange
		l1y2 = y1
		l2x2 = l1x2
		l2y2 = y1 - (sightwidth / 2)
		l3x2 = l1x2
		l3y2 = y1 + (sightwidth / 2)
		break;
	}
	case FACING.UPLEFT:
	{
		x1 = x - ((spritesize / 2) * cos(degtorad(45)))
		y1 = y - ((spritesize / 2) * cos(degtorad(45)))
		l1x2 = x1 - sightrange * cos(degtorad(45))
		l1y2 = y1 - sightrange * cos(degtorad(45))
		
		
		var length = sqrt(sqr(point_distance(x1, y1, l1x2, l1y2)) + (sqr(sightwidth / 2)))
		var rads = sightwidth / (2 * length)
		var theta = 2 * arcsin(rads)
		var temp_x2 = length * (-cos(degtorad(45) - (theta / 2)))
		var temp_y2 = length * (-sin(degtorad(45) - (theta / 2)))
		l2x2 = temp_x2 + x1
		l2y2 = temp_y2 + y1
		
		
		temp_x2 = length * (-cos(degtorad(45) + (theta / 2)))
		temp_y2 = length * (-sin(degtorad(45) + (theta / 2)))
		l3x2 = temp_x2 + x1
		l3y2 = temp_y2 + y1
		break;
	}
	case FACING.UPRIGHT:
	{
		x1 = x + ((spritesize / 2) * cos(degtorad(45)))
		y1 = y - ((spritesize / 2) * cos(degtorad(45)))
		l1x2 = x1 + sightrange * cos(degtorad(45))
		l1y2 = y1 - sightrange * cos(degtorad(45))
		
		
		var length = sqrt(sqr(point_distance(x1, y1, l1x2, l1y2)) + (sqr(sightwidth / 2)))
		var rads = sightwidth / (2 * length)
		var theta = 2 * arcsin(rads)
		var temp_x2 = length * (cos(degtorad(45) - (theta / 2)))
		var temp_y2 = length * (-sin(degtorad(45) - (theta / 2)))
		l2x2 = temp_x2 + x1
		l2y2 = temp_y2 + y1
		
		
		temp_x2 = length * (cos(degtorad(45) + (theta / 2)))
		temp_y2 = length * (-sin(degtorad(45) + (theta / 2)))
		l3x2 = temp_x2 + x1
		l3y2 = temp_y2 + y1
		break;
	}
	case FACING.DOWNLEFT:
	{
		x1 = x - ((spritesize / 2) * cos(degtorad(45)))
		y1 = y + ((spritesize / 2) * cos(degtorad(45)))
		l1x2 = x1 - sightrange * cos(degtorad(45))
		l1y2 = y1 + sightrange * cos(degtorad(45))
		
		
		var length = sqrt(sqr(point_distance(x1, y1, l1x2, l1y2)) + (sqr(sightwidth / 2)))
		var rads = sightwidth / (2 * length)
		var theta = 2 * arcsin(rads)
		var temp_x2 = length * (-cos(degtorad(45) - (theta / 2)))
		var temp_y2 = length * (sin(degtorad(45) - (theta / 2)))
		l2x2 = temp_x2 + x1
		l2y2 = temp_y2 + y1
		
		
		temp_x2 = length * (-cos(degtorad(45) + (theta / 2)))
		temp_y2 = length * (sin(degtorad(45) + (theta / 2)))
		l3x2 = temp_x2 + x1
		l3y2 = temp_y2 + y1
		break;
	}
	case FACING.DOWNRIGHT:
	{
		x1 = x + ((spritesize / 2) * cos(degtorad(45)))
		y1 = y + ((spritesize / 2) * cos(degtorad(45)))
		l1x2 = x1 + sightrange * cos(degtorad(45))
		l1y2 = y1 + sightrange * cos(degtorad(45))
		
		
		var length = sqrt(sqr(point_distance(x1, y1, l1x2, l1y2)) + (sqr(sightwidth / 2)))
		var rads = sightwidth / (2 * length)
		var theta = 2 * arcsin(rads)
		var temp_x2 = length * (cos(degtorad(45) - (theta / 2)))
		var temp_y2 = length * (sin(degtorad(45) - (theta / 2)))
		l2x2 = temp_x2 + x1
		l2y2 = temp_y2 + y1
		
		
		temp_x2 = length * (cos(degtorad(45) + (theta / 2)))
		temp_y2 = length * (sin(degtorad(45) + (theta / 2)))
		l3x2 = temp_x2 + x1
		l3y2 = temp_y2 + y1
		break;
	}
}

draw_line(x1,y1,l1x2,l1y2)
draw_line(x1,y1,l2x2,l2y2)
draw_line(x1,y1,l3x2,l3y2)