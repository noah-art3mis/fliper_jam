extends Label

var BLINK_TIME = 0.8

onready var timer = $BlinkTimer

func _ready():
	timer.set_wait_time(BLINK_TIME)
	
func piscar():
	if timer.get_time_left() < BLINK_TIME / 2:
		visible = true
	else:
		visible = false

func _process(_delta):
	if StateManager.state == StateManager.States.IDLE:
		piscar()
	else:
		visible = false
