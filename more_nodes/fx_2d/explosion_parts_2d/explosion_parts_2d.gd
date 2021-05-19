#tool
class_name ExplosionParts2D, "res://more_nodes/fx_2d/explosion_parts_2d/explosion_parts_2d_icon.png"
extends Particles2D

signal cycle_finished

export(bool) var play_on_start = true
export(bool) var destroy_on_finished = true

export(float) var parts_number = 100
#export(float) var parts_size_scale = 20 
export(float) var parts_size = 50
export(float) var smoke_size = 20
export(float) var explosion_force = 500

export(Texture) var parts_texture 
export(Texture) var smoke_texture

var parts_material = load("res://more_nodes/fx_2d/explosion_parts_2d/explosion_parts_2d.tres")
var smoke_material = load("res://more_nodes/fx_2d/explosion_parts_2d/smoke_parts_2d.tres")
var timer : Timer
var smoke : Particles2D

func _enter_tree():
	self_modulate = Color(1.5,1.5,1)
	timer = Timer.new()
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(timer)
	smoke = Particles2D.new()
	add_child(smoke)
	smoke.z_index=-1
	
	# explosion parts properties
	emitting = play_on_start
	#scale = Vector2(parts_size_scale,parts_size_scale) 
	amount = parts_number
	process_material = parts_material
	process_material.initial_velocity = explosion_force
	process_material.scale=parts_size
	local_coords=false
	if parts_texture!=null:
		texture=parts_texture
	explosiveness = 1
	one_shot=true
	
	# smoke parts properties
	smoke.emitting = play_on_start
	smoke.amount = parts_number 
	smoke.process_material = smoke_material
	smoke.process_material.initial_velocity = explosion_force
	smoke.process_material.scale=smoke_size
	smoke.local_coords=false
	if smoke_texture!=null:
		smoke.texture=smoke_texture
	smoke.explosiveness = 1
	smoke.one_shot=true
	
	timer.start(lifetime)
	timer.connect("timeout",self,"_on_timer_timeout")

func play():
	restart()
	smoke.restart()

func _on_timer_timeout():
	emit_signal("cycle_finished")
	if destroy_on_finished:
		queue_free()





	


