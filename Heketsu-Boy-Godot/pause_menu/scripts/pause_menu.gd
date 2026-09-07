extends CanvasLayer
class_name PauseMenu

@export_category("Menu")
@export var menu_container: PanelContainer
@export var resume_btn: Button
@export var options_btn: Button
@export var quit_to_desktop_btn: Button
@export_category("Confirmation")
@export var confirmation_container: PanelContainer
@export var yes_btn: Button
@export var no_btn: Button

func _ready() -> void:
	assert(menu_container != null, "Attach menu panel container node to %s." % name)
	assert(resume_btn != null, "Attach resume button node to %s." % name)
	assert(options_btn != null, "Attach options button node to %s." % name)
	assert(quit_to_desktop_btn != null, "Attach quit to desktop button node to %s." % name)

	assert(confirmation_container != null, "Attach menu confirmation container node to %s." % name)
	assert(yes_btn != null, "Attach yes button node to %s." % name)
	assert(no_btn != null, "Attach no button node to %s." % name)

	resume_btn.pressed.connect(on_pressed_resume)
	options_btn.pressed.connect(on_pressed_options)
	quit_to_desktop_btn.pressed.connect(on_pressed_quit_to_desktop)
	
	yes_btn.pressed.connect(on_pressed_yes)
	no_btn.pressed.connect(on_pressed_no)

	toggle_game_pause(false)
	toggle_confirmation_menu(false)
	
func _input(event: InputEvent) -> void:
	if (event.is_action_pressed(&"ui_cancel") && !confirmation_container.visible):
		toggle_game_pause(!menu_container.visible)

#region MenuFunctions
func toggle_game_pause(is_pause: bool) -> void:
	menu_container.visible = is_pause
	get_tree().paused = is_pause

func on_pressed_resume() -> void:
	toggle_game_pause(false)

# ALERT: this function appears in 2 scripts(this and main menu) consider standalone component
func on_pressed_options() -> void:
	print_debug("Feature not yet implemented.")

func on_pressed_quit_to_desktop() -> void:
	toggle_confirmation_menu(true)
#endregion

#region ConfirmationFunctions
func toggle_confirmation_menu(is_quit: bool) -> void:
	confirmation_container.visible = is_quit

func on_pressed_yes() -> void:
	get_tree().quit()

func on_pressed_no() -> void:
	toggle_confirmation_menu(false)
#endregion
