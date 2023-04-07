extends AnimatedSprite

func _process(delta):
	if StateManager.state == StateManager.States.IDLE:
		animate_player()
		
	if StateManager.state == StateManager.States.BATTLE:
		animate_player()
		
func animate_player():
	pass
#	TODO

func speak_randomly():
	
