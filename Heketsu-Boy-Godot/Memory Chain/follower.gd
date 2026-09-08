extends Node2D

## This script makes Party Members follow the leader

var acceleration : float
var friction : float
var distance_offset : float

var player_moving : bool = false
var target_pos : Vector2

func _physics_process(delta: float) -> void:
	var pos_lerp_weight : float = 1.0 - exp( -(acceleration if player_moving else friction) * delta)
	
	global_position = lerp(global_position, target_pos, pos_lerp_weight)
