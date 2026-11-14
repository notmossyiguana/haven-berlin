extends Area2D

@onready var sound: AudioStreamPlayer = $AudioStreamPlayer
var triggered := false

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and not triggered:
		triggered = true
		AudioStreamPlayer2d.stop()
		sound.play()
