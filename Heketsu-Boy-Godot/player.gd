extends CharacterBody2D

const TILE_SIZE: float = 32.0
const MOVE_SPEED: float = 0.2

var facing_direction: Enums.FacingDirection = Enums.FacingDirection.DOWN:
	set = set_facing_direction
var action: Enums.Action = Enums.Action.IDLE

var direction_vector: Vector2 = Vector2.DOWN

@onready var sprite: AnimatedSprite2D = $Sprite

func _physics_process(_delta: float) -> void:
	# Prevents this code from running in the editor
	if Engine.is_editor_hint():
		return
	
	match action:
		Enums.Action.IDLE:
			var new_direction: Enums.FacingDirection = get_input_direction()
			if new_direction != Enums.FacingDirection.NONE:
				if new_direction != facing_direction:
					facing_direction = new_direction
				move_character(direction_vector, MOVE_SPEED)
	play_animation_if_moving()


func get_input_direction() -> Enums.FacingDirection:
	if Input.is_action_pressed("Down(PC)"):
		return Enums.FacingDirection.DOWN
	elif Input.is_action_pressed("Up(PC)"):
		return Enums.FacingDirection.UP
	elif Input.is_action_pressed("Left(PC)"):
		return Enums.FacingDirection.LEFT
	elif Input.is_action_pressed("Right(PC)"):
		return Enums.FacingDirection.RIGHT
	else:
		return Enums.FacingDirection.NONE


func get_direction_vector() -> Vector2:
	match facing_direction:
		Enums.FacingDirection.DOWN:
			return Vector2.DOWN
		Enums.FacingDirection.UP:
			return Vector2.UP
		Enums.FacingDirection.LEFT:
			return Vector2.LEFT
		Enums.FacingDirection.RIGHT:
			return Vector2.RIGHT
		_:
			return Vector2.ZERO


func set_facing_direction(new_facing_direction: Enums.FacingDirection) -> void:
	# Prevents this setter from trying to access the sprite too early
	if !is_node_ready():
		await ready
	
	facing_direction = new_facing_direction
	direction_vector = get_direction_vector()
	
	sprite_face_direction()


func sprite_face_direction() -> void:
	match facing_direction:
		Enums.FacingDirection.DOWN:
			sprite.play("front")
		Enums.FacingDirection.UP:
			sprite.play("back")
		Enums.FacingDirection.LEFT:
			sprite.play("left")
		Enums.FacingDirection.RIGHT:
			sprite.play("right")


func play_animation_if_moving() -> void:
	if action == Enums.Action.MOVING:
		sprite.speed_scale = 1.0
	else:
		sprite.speed_scale = 0.0
		sprite.frame = 0

func move_character(dir_vector: Vector2, move_speed: float) -> void:
	if action == Enums.Action.IDLE:
		action = Enums.Action.MOVING
		
		var new_position: Vector2 = position + (dir_vector * TILE_SIZE)
		
		# Using tweens to show the grid-based movement
		var tween: Tween = create_tween()
		tween.tween_property(self, "position", new_position, move_speed)
		tween.tween_callback(_on_move_finished)


func _on_move_finished() -> void:
	action = Enums.Action.IDLE
