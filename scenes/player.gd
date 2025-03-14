extends Area2D

signal go_to(pos)

var moving = false
var target_pos
var speed: float = 50


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	go_to.connect(set_target)
	target_pos = position
	

func update_pos(delta: float):
	if !moving or int(position.x) == int(target_pos.x):
		print("Standing")
		moving = false
		return
	print(target_pos, position)
	if position.x > target_pos.x:
		position.x -= speed * delta
	else:
		position.x += speed * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_pos(delta)
	if moving:
		$AnimatedSprite2D.animation = "walk"
		if int(position.x) < int(target_pos.x):
			$AnimatedSprite2D.flip_h = false
		elif int(position.x) > int(target_pos.x):
			$AnimatedSprite2D.flip_h = true
		
		if $AnimatedSprite2D.flip_h:
			print("cs")
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 7

func set_target(pos):
	target_pos = pos
	moving = true
