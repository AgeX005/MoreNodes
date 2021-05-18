extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			var parts = ExplosionParts2D.new()
			add_child(parts)
			parts.position=event.position
