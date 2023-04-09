extends TextureRect

func _process(delta):
	if StateManager.state == StateManager.States.IDLE:
		visible = true
	else:
		visible = false
