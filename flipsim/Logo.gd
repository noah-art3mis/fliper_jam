extends TextureRect


func _process(_delta):
	if StateManager.state == StateManager.States.IDLE:
		visible = true
	else:
		visible = false
