extends Node2D

var invenotry_opened = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and !invenotry_opened:
		var dist = abs($Player.position - event.position)
		if $Player.moving or (dist[0] > 300):
			$Player.set_target(event.position)

func _on_player_click(_event: InputEventMouseButton) -> void:
	if !invenotry_opened:
		print("Open Inventory")
	invenotry_opened = !invenotry_opened
