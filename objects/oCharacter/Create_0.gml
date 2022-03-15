/// @description Insert description here
// You can write your code in this editor
spd = 5
enum PLAYERSTATES
{
	IDLE,
	WALKING,
	WINDUP,
	ATTACK
}
state = PLAYERSTATES.IDLE

enum FACING
{
	UP,
	DOWN,
	LEFT,
	RIGHT,
	UPLEFT,
	UPRIGHT,
	DOWNLEFT,
	DOWNRIGHT,
}

c_color = c_white
facing = FACING.DOWN
subimg = 0
attack = undefined
_health = 10
dash_multiplyer = 10
windup_initiated = false
weapon = instance_create_layer(x, y, layer, oWeapon)