extends Area2D

@export var bounce_velocity := -900.0
@onready var sound: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.velocity.y >= 0:
		body.velocity.y = bounce_velocity
		sound.play()
