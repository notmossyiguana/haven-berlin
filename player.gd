extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
@onready var sprite: Sprite2D = $Sprite2D

var idle_tex = preload("res://daven-idle.png")
var jump_tex = preload("res://daven-jump.png")
var fall_tex = preload("res://daven-fall.png")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if not is_on_floor():
		if velocity.y < 0:
			sprite.texture = jump_tex
		else:
			sprite.texture = fall_tex
	else:
		sprite.texture = idle_tex

	if direction:
		sprite.flip_h = direction < 0
	move_and_slide()
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo and event.physical_keycode == KEY_P:
		get_tree().reload_current_scene()
