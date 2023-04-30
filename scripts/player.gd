extends KinematicBody2D

export(int) var speed

var dir:Vector2 = Vector2.ZERO

var dir_x:int
var dir_y:int

onready var sprite = $sprite

func _ready():
	sprite.play("idle_D")
	
func _process(delta):
	
	var input_x = Input.get_axis("ui_left" , "ui_right")
	var input_y = Input.get_axis("ui_up" , "ui_down")
	
	dir.x = input_x
	dir.y = input_y
	
	if input_x != 0 or input_y != 0:
		_anim(input_x , input_y)
	else:
		_idle()
	
	dir = move_and_slide(dir * abs(speed) * delta)
	
	global_position.x = clamp(global_position.x , 14 , 497)
	global_position.y = clamp(global_position.y , 17 , 273)
	
func _anim(x:int , y:int):
	dir_x = x
	dir_y = y
	if x == 1:
		sprite.play("run_R_L")
		sprite.flip_h = true
	elif x == -1:
		sprite.play("run_R_L")
		sprite.flip_h = false
	elif y == 1:
		sprite.play("run_D")
	elif y == -1:
		sprite.play("run_U")
	else:
		sprite.play("idle_D")

func _idle():
	if dir_x == 1:
		sprite.play("idle_R_L")
		sprite.flip_h = true
	elif dir_x == -1:
		sprite.play("idle_R_L")
		sprite.flip_h = false
	elif dir_y == 1:
		sprite.play("idle_D")
	elif dir_y == -1:
		sprite.play("idle_U")
