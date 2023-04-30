extends KinematicBody2D

onready var target = $"../../../player"
onready var sprite = $sprite

export(int) var speed

func _ready():
	speed = rand_range(2000 , 4500)

func _physics_process(delta):
	var dir = global_position.direction_to(target.global_position)
	move_and_slide(dir * speed * delta)
	sprite.play("move")
	
	_set_direction(dir.normalized())
	
func _set_direction(dir:Vector2):
	if dir.x < 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true

func _on_hit_box_area_entered(area):
	queue_free()

func _on_hit_box_body_entered(body):
	if body.name == "player":
		print("touch")
