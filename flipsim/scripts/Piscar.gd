extends Label

onready var timer = get_node("Timer")

func piscar():
	if timer.get_time_left() > 0.5:
		visible = false
	else:
		visible = true

func _process(_delta):
	if StateManager.state == StateManager.States.IDLE:
		piscar()
	else:
		visible = false
