extends Control
class_name MainMenu

@export_category("Buttons")
@export var new_game_btn: Button
@export var load_btn: Button
@export var options_btn: Button
@export var quit_btn: Button

# TODO: Implement logic for starting new game, loading game, and going to options
func _ready() -> void:
	assert(new_game_btn != null, "Attach new game button node to %s." % name)
	assert(load_btn != null, "Attach load button node to %s." % name)
	assert(options_btn != null, "Attach options button node to %s." % name)
	assert(quit_btn != null, "Attach quit button node to %s." % name)

	new_game_btn.pressed.connect(on_new_game_pressed)
	load_btn.pressed.connect(on_load_pressed)
	options_btn.pressed.connect(on_options_pressed)
	quit_btn.pressed.connect(on_quit_pressed)

#region BtnFunctions
func on_new_game_pressed() -> void:
	print_debug("Not yet implemented")

func on_load_pressed() -> void:
	print_debug("Not yet implemented")

func on_options_pressed() -> void:
	print_debug("Not yet implemented")

func on_quit_pressed() -> void:
	get_tree().quit()
#endregion