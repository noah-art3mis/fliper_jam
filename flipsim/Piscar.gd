extends Label

onready var timer = get_node("Timer")

func _process(delta):
	print(timer.get_time_left())

##timer comeca no 2 e reseta
#func piscar():
#if timer.time_left > 1:
#	visible = false
#else
#	visible = true
