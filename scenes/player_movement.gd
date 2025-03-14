extends Node


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var dist = abs($Player.position - event.position)
		if $Player.moving or (dist[0] > 300):
			$Player.go_to.emit(event.position)


func _on_player_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1:
			print("Open Inventory")
