/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case PLAYERSTATES.WINDUP:
	{
		if(not windup_initiated)
		{
			windup_initiated = true
			c_color = c_red
			alarm[10] = weapon.windup
			break;
		}
		if(attack != undefined) state = PLAYERSTATES.ATTACK
		break
	}
	case PLAYERSTATES.ATTACK:
	{
		windup_initiated = false
		if(attack == undefined) state = PLAYERSTATES.IDLE
		break
	}
}