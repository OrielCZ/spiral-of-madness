extends Area2D

@export var next_scene: String = "res://scenes/rooms/secndroom.tscn"

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if ResourceLoader.exists(next_scene):  # Ověří, zda soubor existuje
			get_tree().change_scene_to_file(next_scene)
		else:
			print("Scéna nenalezena:", next_scene)
