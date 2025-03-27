extends Area2D

@onready var label = $Label

func _ready():
	label.hide()  # Skryje text na začátku

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		label.text = get_random_comment()
		label.show()
		await get_tree().create_timer(5.0).timeout  # Po 5 sekundách zmizí
		label.hide()

func get_random_comment():
	var comments = ["To je pěkné auto!", "Kéž by bylo moje...", "Tahle barva je hrozná."]
	return comments[randi() % comments.size()]
