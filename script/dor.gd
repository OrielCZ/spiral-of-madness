extends Area2D

@export var target_scene: String  # Cílová scéna
@export var door_id: String  # ID dveří (např. "kitchen_door")

func _ready():
	add_to_group("doors")  # Přidá dveře do skupiny

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed: # Jen hráč prochází dveřmi
		# Uložíme, odkud hráč přišel
		var global_state = get_node("/root/GlobalState")
		global_state.last_door = door_id  

		# Změna scény
		get_tree().change_scene_to_file(target_scene)
