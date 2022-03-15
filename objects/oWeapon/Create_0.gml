/// @description Insert description here
// You can write your code in this editor
attack = oAttack
windup = 25
tmp_atk = instance_create_layer(x, y, layer, attack)
reach = tmp_atk.reach
instance_destroy(tmp_atk)