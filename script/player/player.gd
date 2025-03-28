extends Area2D

signal click(event: InputEventMouseButton)

var moving = false
var target_pos
var speed: float = 50
var animating = false
@export var inventory: Inventory

# Called when the node enters the scene tree for the first time.
func _ready():
	target_pos = position
	var global_state = get_node("/root/GlobalState")
	
	if global_state.last_door != "":
		for door in get_tree().get_nodes_in_group("doors"):
			if door.door_id == global_state.last_door:
				global_position = door.global_position + Vector2(0, 50)  # Posun před dveře
				break  # Hráče už jsme přesunuli, dál nehledáme

func move(delta: float) -> void:
	print(target_pos, position)
	if position.x > target_pos.x:
		position.x -= speed * delta
	else:
		position.x += speed * delta

func update_pos(delta: float):
	if !moving:
		if $AnimatedSprite2D.frame != 3 and $AnimatedSprite2D.frame != 7:
			move(delta)
		else:
			animating = false
		return
	if abs(int(position.x) - int(target_pos.x)) < 100:
		print("Standing")
		moving = false
		return
	move(delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_pos(delta)
	if animating:
		$AnimatedSprite2D.animation = "walk"
		if int(position.x) < int(target_pos.x):
			$AnimatedSprite2D.flip_h = false
		elif int(position.x) > int(target_pos.x):
			$AnimatedSprite2D.flip_h = true
		
		$AnimatedSprite2D.speed_scale = 1.5;
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 7

func set_target(pos):
	target_pos = pos
	moving = true
	animating = true

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and !event.pressed:
			click.emit(event)
