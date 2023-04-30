extends Node

export(int) var slimes_mim
export(int) var slimes_max
export(Array , PackedScene) var slimes

onready var slimes_group = $slimes_group
onready var timer = $timer
onready var position = $position

func _ready():
	randomize()
	_choice_slime()

func _choice_slime():
	var count_slimes = rand_range(slimes_mim , slimes_max)
	for s in count_slimes:
		var rand = (randi() % slimes.size())
		var choice_slime = slimes[rand]
		_spaw_slimes(choice_slime)
	timer.start()

func _spaw_slimes(_slime:PackedScene):
	var slime = _slime.instance()
	slimes_group.add_child(slime)
	slime.global_position = position.global_position + Vector2(0 , rand_range(50 , -50))

func _on_timer_timeout():
	if slimes_group.get_child_count() > 0:
		for s in slimes_group.get_child_count():
			slimes_group.get_child(s).queue_free()
		_choice_slime()
	else: _choice_slime()
