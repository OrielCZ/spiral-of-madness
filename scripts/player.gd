extends CharacterBody2D

@export var speed: float = 200.0
var target_position: Vector2
var moving: bool = false

func _ready():
	target_position = global_position

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		target_position = Vector2(event.position.x, global_position.y)
		moving = true

func _physics_process(_delta):
	if moving:
		var direction = sign(target_position.x - global_position.x)
		velocity.x = direction * speed
		if abs(target_position.x - global_position.x) < 5:
			velocity.x = 0
			moving = false
	else:
		velocity.x = 0
	move_and_slide()
