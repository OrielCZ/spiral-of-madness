extends Node


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		$Player.go_to.emit(event.position)
