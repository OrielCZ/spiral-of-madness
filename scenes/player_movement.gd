extends Node


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var dist = abs($Player.position - event.position)
		if $Player.moving or (dist[0] > 300):
			$Player.set_target(event.position)


func _on_player_click(_event: InputEventMouseButton) -> void:
	print("Open Inventory")
