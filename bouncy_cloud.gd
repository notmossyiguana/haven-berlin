extends Area2D

@export var bounce_velocity := -900.0  # more negative = higher bounce

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.velocity.y >= 0:  # only when falling
		body.velocity.y = bounce_velocity
