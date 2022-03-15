/// @description Insert description here
// You can write your code in this editor
if(menu_control)
{
	if(global.move_up)
	{
		menu_cursor = min(menu_cursor + 1, menu_items - 1)
		menu_control = false
		alarm[0] = 10
	}
	if(global.move_down)
	{
		menu_cursor = max(menu_cursor - 1, 0)
		menu_control = false
		alarm[0] = 10
	}
	if(global.move_a)
	{
		menu[menu_cursor].action()
	}
}