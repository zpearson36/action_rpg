/// @description Insert description here
// You can write your code in this editor
spd = 5
enum PLAYERSTATES
{
	IDLE,
	WALKING,
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

facing = FACING.DOWN
subimg = 0
attack = undefined
_health = 10