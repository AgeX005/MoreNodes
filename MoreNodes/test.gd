extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _input(event):
	if Input.is_action_just_pressed("ui_accept"):get_tree().paused=!get_tree().paused
	if event is InputEventMouseButton:
		if event.pressed:
			var parts = ExplosionParts2D.new()
			parts.play_on_start=false
			add_child(parts)
			parts.position=event.position
			

